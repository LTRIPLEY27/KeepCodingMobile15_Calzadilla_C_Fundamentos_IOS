//
//  DataLayer.swift
//  KeepCoding_DragonBallAPI_Calzadilla_C
//
//  Created by IsaDevs on 19/12/22.
//

import Foundation
// PERSISTENCIA O CONFIG ARCHIVE
final class LocalData {
    private static let token = "token"
    private static let allCharacters = "characters" // --> ALAMCENA LOS REGISTROS DE LA API EN EL ARCHIVO CONFIG DEL PROYECTO
    
    static let shared = LocalData()
    
    
    // MANEJO DEL TOKEN
    
    // ALMACENA EL TOKEN
    func save(token : String) {
        return UserDefaults.standard.set(token, forKey: Self.token)
    }
    
    // RECUPERA EL TOKEN
    func getToken() -> String {
        return UserDefaults.standard.string(forKey: Self.token) ?? ""
    }
    
    // VERIFICA EL TOKEN
    func isUserLogged() -> Bool {
        return !getToken().isEmpty
    }
    
    // FUNCIÓN DE ALMACENAJE DE LOS REGISTROS EN LA DATALOCAL
    func charactersOnLocal() -> [Character] {
        // USO DE LOS USER DEFAULTS PARA REALIZAR LA CONSULTA
        if let addCharacter = UserDefaults.standard.object(forKey: Self.allCharacters) as? Data {
            do {
                let saveCharacter = try JSONDecoder().decode([Character].self, from: addCharacter)
                return saveCharacter
            }
            catch
            {
                print("Error adding data to local")
                return []
            }
        } else {
                return []
                }
    }

}
