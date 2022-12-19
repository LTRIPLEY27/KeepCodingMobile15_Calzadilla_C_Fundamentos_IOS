//
//  DataLayer.swift
//  KeepCoding_DragonBallAPI_Calzadilla_C
//
//  Created by IsaDevs on 19/12/22.
//

import Foundation

final class LocalData {
    private static let token = "token"
    
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
}
