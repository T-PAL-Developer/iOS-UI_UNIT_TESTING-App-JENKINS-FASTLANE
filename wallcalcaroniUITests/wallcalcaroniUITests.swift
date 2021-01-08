//
//  wallcalcaroniUITests.swift
//  wallcalcaroniUITests
//
//  Created by Tomasz Paluszkiewicz on 07/01/2021.
//  Copyright © 2021 Tomasz Paluszkiewicz. All rights reserved.
//

import XCTest

class wallcalcaroniUITests: XCTestCase {

    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    override func tearDownWithError() throws {
        app = nil
    }

    func testButtons_WhenTapped_ShouldShowResult() {
        app.buttons["1"].tap()
        app.buttons["2"].tap()
        app.buttons["3"].tap()
        XCTAssertTrue(app.staticTexts["123"].exists)
    }
  
}
