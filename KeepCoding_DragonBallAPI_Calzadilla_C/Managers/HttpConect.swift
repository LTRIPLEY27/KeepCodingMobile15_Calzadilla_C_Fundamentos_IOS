//
//  HttpConect.swift
//  KeepCoding_DragonBallAPI_Calzadilla_C
//
//  Created by IsaDevs on 19/12/22.
//

import Foundation

final class HttpSession {
    
    static let shared = HttpSession()
    
    private var objects: [AnyObject] = []
    
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
    
    // MÉTODO PARA OBTENER TODOS LOS REGISTROS
    
    func allRegisters(token: String?, completion: @escaping ([Character]?, Error?) -> Void ) {
        guard let url = URL(string: "https://dragonball.keepcoding.education/api/heros/all") else {
            completion(nil, NetworkError.malformedURL)
            return
        }
        
        var urlComponents = URLComponents()
        urlComponents.queryItems = [URLQueryItem(name: "name", value: "")]
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.setValue("Bearer \(token ?? "")", forHTTPHeaderField: "Authorization")
        
        urlRequest.httpBody = urlComponents.query?.data(using: .utf8)
        
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, _, error in
            guard error == nil else {
                completion(nil, error)
                return
            }
            
            guard let data = data else {
                completion(nil, NetworkError.noData)
                return
            }
            
            guard let characters = try? JSONDecoder().decode([Character].self, from: data) else {
                completion(nil, NetworkError.decodingFailed)
                return
            }
            
            completion(characters, nil)
        }
        
        task.resume()
        
    }
     
    
    // FUNCIÓN PARA OBTENER LOS REGISTROS DE TRANSFORMACIONES
    func getTransformations(token : String?, characterId : String?, completion : @escaping([Transformation]?, Error?) -> Void) {
        
        guard let url = URL(string: "https://dragonball.keepcoding.education/api/heros/tranformations") else {
            completion(nil, NetworkError.malformedURL)
            return
        }
        
        var urlComponents = URLComponents()
        urlComponents.queryItems = [URLQueryItem(name: "id", value: characterId ?? "")]
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.setValue("Bearer \(token ?? "")", forHTTPHeaderField: "Authorization")
        urlRequest.httpBody = urlComponents.query?.data(using: .utf8)
        
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            
            guard error == nil else {
                completion(nil, error)
                return
            }
            
            guard (response as? HTTPURLResponse)?.statusCode == 200 else {
                let statusCode = (response as? HTTPURLResponse)?.statusCode
                completion(nil, NetworkError.statusCode(code: statusCode))
                print("Error loading URL: Status error --> ", (response as? HTTPURLResponse)?.statusCode ?? -1)
                return
            }
            
            guard let data = data else {
                completion(nil, NetworkError.noData)
                return
            }
            
            guard let transform = try? JSONDecoder().decode([Transformation].self, from: data) else {
                completion(nil, NetworkError.decodingFailed)
                return
            }
            
            completion(transform, nil)
        }
        
        task.resume()
    }
    

}
