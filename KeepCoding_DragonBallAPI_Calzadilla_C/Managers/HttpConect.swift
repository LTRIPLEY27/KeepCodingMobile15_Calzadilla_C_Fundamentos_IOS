//
//  HttpConect.swift
//  KeepCoding_DragonBallAPI_Calzadilla_C
//
//  Created by IsaDevs on 19/12/22.
//

import Foundation

final class HttpSession {
    
    static let shared = HttpSession()
    
    
    // FUNCIÓN PARA CAPTURAR EL TOKEN
    func login(email : String, password : String, completion : @escaping (String?, Error?) -> Void) {
        
        guard let url = URL(string: "https://dragonball.keepcoding.education/api/auth/login") else {
            completion(nil, NetworkError.malformedURL)
            return
        }
        
        // PARSEAMOS A BASE64 EL STRING
        let logintString = "\(email):\(password)"
        let loginData: Data = logintString.data(using: .utf8)!
        let base64 = loginData.base64EncodedString()
        
        var urlRequest = URLRequest(url: url) // REFIERE A LA VARIABLE DEFINIDA AL GUARD LETS
        urlRequest.httpMethod = "POST"
        urlRequest.setValue("Basic \(base64)", forHTTPHeaderField: "Authorization")
        
        // CAPTURAMOS EL REQUEST
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            
            // verifica si devuelve error, en caso afirmativo rompe la ejecución, caso contrario continúa con el siguiente guard
            guard error == nil else {
                completion(nil, error)
                return
            }
            
            // verifica si hay datos, caso contrario culmina la ejecución con error 'noData'
            guard let data = data else {
                completion(nil, NetworkError.noData)
                return
            }
            
            // VERIFICA SI EL RESULTADO DEL REQUEST ES '200', CASO CONTRARIO CIERRA
            guard (response as? HTTPURLResponse)?.statusCode == 200 else {
                let statusCode = (response as? HTTPURLResponse)?.statusCode
                completion(nil, NetworkError.statusCode(code: statusCode))
                return
            }
            
            // VERIFICA QUE LA CONSULTA ESTÉ PARSEADA, CASO CONTRARIO QUIEBRA LA EJECUCIÓN
            guard let token = String(data: data, encoding: .utf8) else {
                completion(nil, NetworkError.decodingFailed)
                return
            }
            
            completion(token, nil)
        }
        
        task.resume()
    }
}
