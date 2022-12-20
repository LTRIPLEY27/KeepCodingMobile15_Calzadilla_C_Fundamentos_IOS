//
//  CharacterClass.swift
//  KeepCoding_DragonBallAPI_Calzadilla_C
//
//  Created by IsaDevs on 19/12/22.
//

import Foundation

struct Character: Codable {
    
    let id: String
    let name : String
    let photo : String
    let description : String
    let isFavorite : Bool
}
