//
//  TransformationTest.swift
//  KeepCoding_DragonBallAPI_Calzadilla_CTests
//
//  Created by IsaDevs on 28/12/22.
//

import XCTest

@testable import KeepCoding_DragonBallAPI_Calzadilla_C

final class TransformationTest: XCTestCase {
    
    var transformation : Transformation!

    override func setUp() {
        super.setUp()
        
        transformation = Transformation(id : "666",
                                        hero: ["id" : "111"],
                                        name : "Gorilin",
                                        photo : "gorilin.jpg",
                                        description: "Gorilin is the best")
    }

    override func tearDown() {
        transformation = nil
        super.tearDown()
        
    }

    func testTransforId() {

        XCTAssertNotNil(transformation.id)
        XCTAssertTrue(transformation.id == "666")
        XCTAssertFalse(transformation.id == "111")
    }

    func testTransforHero() {
        
        XCTAssertNotNil(transformation.hero["id"])
        XCTAssertFalse(transformation.hero["id"] == "666")
        XCTAssertTrue(transformation.hero["id"] == "111")
    }
    
    func testTransforName() {
        XCTAssertNotNil(transformation.name)
        XCTAssertEqual(transformation.name, "Gorilin")
        XCTAssertFalse(transformation.name == "Broly")
    }
    
    func testTransforPhoto() {
        
        XCTAssertTrue(!transformation.photo.isEmpty)
        XCTAssertEqual(transformation.photo, "gorilin.jpg")
        XCTAssertFalse(transformation.photo.isEmpty)
    }
    
    func testTransforDescription() {
        
        XCTAssertTrue(!transformation.description.isEmpty)
        XCTAssertFalse(transformation.description == "")
        XCTAssertNotEqual(transformation.description, "Gorilin is the worst")
        XCTAssertTrue(transformation.description == "Gorilin is the best")
    }
}
