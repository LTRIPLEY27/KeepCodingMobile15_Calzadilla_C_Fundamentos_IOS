//
//  CharacterClass.swift
//  KeepCoding_DragonBallAPI_Calzadilla_C
//
//  Created by IsaDevs on 19/12/22.
//

import Foundation

// LAS VARIABLES DEBEN DE COINCIDIR EN NOMBRE CON LA API, A MENOS DE QUE SE MARQUE OPCIONAL
struct Character: Codable {
    
    var id : String
    var name : String
    var photo : String
    var description : String
    var favorite : Bool
}
