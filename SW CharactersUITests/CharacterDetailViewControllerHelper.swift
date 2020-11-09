//
//  CharacterDetailViewControllerHelper.swift
//  SW CharactersUITests
//
//  Created by Mahesh sai on 09/11/20.
//

import Foundation
import XCTest

struct CharacterDetailViewControllerHelper {
    
     func testCharacterDetailScreen(of app:XCUIApplication) {
        tapCharacterCellButton(of: app)
        
        testDetailCharacter(of: app)
        
        testRemoveCharacter(of: app)
    }
    func tapCharacterCellButton(of app:XCUIApplication) {
        app.tables[Identifiers.tableIdentifier].cells.element(boundBy: 0).tap()
    }
    func testDetailCharacter(of app:XCUIApplication) {
        
        XCTAssertEqual(app.staticTexts.element(matching:.any, identifier: Identifiers.characterDetailNameLabel).label.isEmpty,false)
        XCTAssertEqual(app.staticTexts.element(matching:.any, identifier: Identifiers.characterDetailEyeLabel).label.isEmpty,false)
        XCTAssertEqual(app.staticTexts.element(matching:.any, identifier: Identifiers.characterDetailHeightLabel).label.isEmpty,false)
    }
    func testRemoveCharacter(of app:XCUIApplication) {
        app.buttons[Identifiers.characterDetailRemoveButtonIdentifier].tap()
    }
}

