//
//  SW_CharactersUITests.swift
//  SW CharactersUITests
//
//  Created by Mahesh sai on 27/10/20.
//

import XCTest

class SW_CharactersUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testTableView() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launchArguments = ["enable-testing"]
        app.launch()
            app.tables["CharacterList"].tap()
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    func testAdd()
    {
        
        
        let app = XCUIApplication()
        XCUIApplication().activate()
        app.navigationBars["SW Characters"].buttons["Add"].tap()
        
        let element = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
        element.children(matching: .other).element(boundBy: 0).children(matching: .textField).element.tap()
        
        let textField = element.children(matching: .other).element(boundBy: 1).children(matching: .textField).element
        textField.tap()
        textField.tap()
        
        let textField2 = element.children(matching: .other).element(boundBy: 2).children(matching: .textField).element
        textField2.tap()
        textField2.tap()
        app/*@START_MENU_TOKEN@*/.staticTexts["Save"]/*[[".buttons[\"Save\"].staticTexts[\"Save\"]",".staticTexts[\"Save\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
    
    }
    func testDetail()
    {
        
        let app = XCUIApplication()
        app.launch()
        app.tables["CharacterList"]/*@START_MENU_TOKEN@*/.staticTexts["Obi-Wan Kenobi"]/*[[".cells.staticTexts[\"Obi-Wan Kenobi\"]",".staticTexts[\"Obi-Wan Kenobi\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.staticTexts["Obi-Wan Kenobi"].tap()
        app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element(boundBy: 1).tap()
        app.staticTexts["blue-gray"].tap()
        
        
    }
    func testLaunchPerformance() throws {
        
    }
}
