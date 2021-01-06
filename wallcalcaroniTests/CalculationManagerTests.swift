//
//  CalculationManagerTests.swift
//  wallcalcaroniTests
//
//  Created by Tomasz Paluszkiewicz on 06/01/2021.
//  Copyright © 2021 Tomasz Paluszkiewicz. All rights reserved.
//

import XCTest
@testable import wallcalcaroni


class CalculationManagerTests: XCTestCase {
    
    // sut = System Under Test
    var sut: CalculationManager!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = CalculationManager()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
    }

    func testInit_WhenGivenValues_TakesValues() {
        let calcManager1 = CalculationManager(valueA: 10, valueB: 20, currentOperand: .multiply, valueEntryArray: [])
        let calcManager2 = CalculationManager(valueA: 10, valueB: 20, currentOperand: .multiply, valueEntryArray: [])
       XCTAssertEqual(calcManager1, calcManager2)
    }
    
    func testValues_AreInitiallyZero() {
        XCTAssertEqual(sut.valueA, 0)
        XCTAssertEqual(sut.valueB, 0)
    
    }
    
    func testValues_InsertingValues_ChangesValueA() {
        sut.insert(value: 10)
        XCTAssertEqual(sut.valueA, 10)
    }
 
    // with comment when test faild
    func testOperand_IsInitiallyNill() {
        XCTAssertNil(sut.currentOperand, "Operand should be nil.")
    }
    
    func testOperand_WhenGivenOperand_SetsOperand() {
        sut.insert(value: 20)
        sut.set(operand: .subtract)
        XCTAssertNotNil(sut.currentOperand)
    }
    
    func testCalculation_ForValues() {
        sut.insert(value: 10)
        sut.set(operand: .multiply)
        sut.insert(value: 5)
        XCTAssertEqual(sut.calculate(), 50)
    }
    
    func testClear_WhenCalledClearsValues() {
        sut.insert(value: 20)
        _ = sut.clearValues()
        XCTAssertEqual(sut.valueA, 0)
        XCTAssertEqual(sut.valueB, 0)
        XCTAssertEqual(sut.valueEntryArray, [])
    }
   
}
