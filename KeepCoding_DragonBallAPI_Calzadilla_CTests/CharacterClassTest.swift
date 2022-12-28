//
//  CharacterClassTest.swift
//  KeepCoding_DragonBallAPI_Calzadilla_CTests
//
//  Created by IsaDevs on 28/12/22.
//

import XCTest
@testable import KeepCoding_DragonBallAPI_Calzadilla_C

final class CharacterClassTest: XCTestCase {
    
    var characterRoshi: Character!
    var characterGoku: Character!
    var characters : [Character] = LocalData.shared.charactersOnLocal()
    
    
    override func setUp() {
        super.setUp()
        // INICIALIZAMOS EL TEST TOMANDO LOS PERSONAJES ALMACENADOS EN LOCAL, ESPECÍFICAMENTE A 'GOKU' Y A 'ROSHI'
        characterRoshi = characters[0]
        characterGoku = characters[3]
    }

    override func tearDown() {
        characterRoshi = nil
        characterGoku = nil
        super.tearDown()
    }

    func testCharacterName(){
        let roshi : String = "Maestro Roshi"
        let goku : String = "Goku"
        
        XCTAssertEqual(characterRoshi.name, roshi)
        XCTAssertEqual(characterGoku.name, goku)
        XCTAssertFalse(characterGoku.name == "Vegeta")
        XCTAssertFalse(characterRoshi.name == "Satan")
        
    }

    func testCharacterId() {
        let roshi : String = "14BB8E98-6586-4EA7-B4D7-35D6A63F5AA3"
        let goku : String = "D13A40E5-4418-4223-9CE6-D2F9A28EBE94"
        
        XCTAssertNotNil(characterRoshi.id)
        XCTAssertNotNil(characterGoku.id)
        XCTAssertEqual(characterGoku.id, goku)
        XCTAssertEqual(characterRoshi.id, roshi)
    }

    func testCharacterPhoto() {
        let roshi : String = "https://cdn.alfabetajuega.com/alfabetajuega/2020/06/Roshi.jpg?width=300"
        let goku : String = "https://cdn.alfabetajuega.com/alfabetajuega/2020/12/goku1.jpg?width=300"
        
        XCTAssertEqual(characterRoshi.photo, roshi)
        XCTAssertEqual(characterGoku.photo, goku)
        XCTAssertFalse(characterGoku.photo == "goku.jpg")
        XCTAssertFalse(characterRoshi.photo == "roshi.png")
    }
    
    func testCharacterDescription() {
        let roshi : String = "Es un maestro de artes marciales que tiene una escuela, donde entrenará a Goku y Krilin para los Torneos de Artes Marciales. Aún en los primeros episodios había un toque de tradición y disciplina, muy bien representada por el maestro. Pero Muten Roshi es un anciano extremadamente pervertido con las chicas jóvenes, una actitud que se utilizaba en escenas divertidas en los años 80. En su faceta de experto en artes marciales, fue quien le enseñó a Goku técnicas como el Kame Hame Ha"
        let goku : String = "Sobran las presentaciones cuando se habla de Goku. El Saiyan fue enviado al planeta Tierra, pero hay dos versiones sobre el origen del personaje. Según una publicación especial, cuando Goku nació midieron su poder y apenas llegaba a dos unidades, siendo el Saiyan más débil. Aun así se pensaba que le bastaría para conquistar el planeta. Sin embargo, la versión más popular es que Freezer era una amenaza para su planeta natal y antes de que fuera destruido, se envió a Goku en una incubadora para salvarle."
        
        XCTAssertEqual(characterGoku.description, goku)
        XCTAssertEqual(characterRoshi.description, roshi)
        XCTAssertFalse(characterGoku.description.isEmpty)
        XCTAssertFalse(characterRoshi.description.isEmpty)
    }
    
    func testCharacterFavorites() {
        let goku : Bool = true
        let roshi : Bool = false
        
        XCTAssertEqual(characterGoku.favorite, goku)
        XCTAssertEqual(characterRoshi.favorite, roshi)
        XCTAssertTrue(characterGoku.favorite == true)
        XCTAssertFalse(characterRoshi.favorite == true)
    }
}
