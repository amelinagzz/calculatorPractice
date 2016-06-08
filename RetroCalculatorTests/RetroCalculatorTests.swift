//
//  RetroCalculatorTests.swift
//  RetroCalculatorTests
//
//  Created by Adriana Gonzalez on 2/8/16.
//  Copyright © 2016 Adriana Gonzalez. All rights reserved.
//

import XCTest
@testable import RetroCalculator

class RetroCalculatorTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
   
    func testAudioService(){
        XCTAssertNotNil(AudioService.instance)
        
        XCTAssertNotNil(AudioService.instance.pathForResource("btn", fileType: "wav"))
        
        XCTAssertNotNil(AudioService.instance.btnUrl)
    
        XCTAssertNil(AudioService.instance.createPlayerWithUrl(NSURL(string: "")!))
        
        XCTAssertNotNil(AudioService.instance.createPlayerWithUrl(AudioService.instance.btnUrl!))
        
        XCTAssertNil(AudioService.instance.soundFXPlayer)
        
        XCTAssertFalse(AudioService.instance.playCurrentSoundFX())
        
        AudioService.instance.soundFXPlayer = AudioService.instance.createPlayerWithUrl(AudioService.instance.btnUrl!)
        
        XCTAssertNotNil(AudioService.instance.soundFXPlayer)
        
        XCTAssertTrue(AudioService.instance.playCurrentSoundFX())

    }
    
    func testCalcService(){
        XCTAssertNotNil(CalcService.instance)
        XCTAssertEqual(CalcService.Operation.Add.rawValue, "+", "Incorrect operator")
        XCTAssertEqual(CalcService.Operation.Subtract.rawValue, "-", "Incorrect operator")
        XCTAssertEqual(CalcService.Operation.Multiply.rawValue, "*", "Incorrect operator")
        XCTAssertEqual(CalcService.Operation.Divide.rawValue, "/", "Incorrect operator")
        XCTAssertEqual(CalcService.Operation.Empty.rawValue, "Empty", "Incorrect operator")
        
        XCTAssertNil(CalcService.instance.multiply("aaa", numStrB: "bbb"))
        XCTAssertNotNil(CalcService.instance.multiply("2", numStrB: "8"))
        XCTAssertEqual(CalcService.instance.multiply("5", numStrB: "5"), "25.0")
        
        XCTAssertNil(CalcService.instance.divide("aaa", numStrB: "bbb"))
        XCTAssertNotNil(CalcService.instance.divide("2", numStrB: "8"))
        XCTAssertEqual(CalcService.instance.divide("5", numStrB: "5"), "1.0")
        
        XCTAssertNil(CalcService.instance.add("aaa", numStrB: "bbb"))
        XCTAssertNotNil(CalcService.instance.add("2", numStrB: "8"))
        XCTAssertEqual(CalcService.instance.add("5", numStrB: "5"), "10.0")
        
        XCTAssertNil(CalcService.instance.subtract("aaa", numStrB: "bbb"))
        XCTAssertNotNil(CalcService.instance.subtract("2", numStrB: "8"))
        XCTAssertEqual(CalcService.instance.subtract("5", numStrB: "4"), "1.0")
        
    }
    
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}
