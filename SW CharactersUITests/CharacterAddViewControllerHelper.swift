//
//  CharacterAddViewControllerHelper.swift
//  SW CharactersUITests
//
//  Created by Mahesh sai on 09/11/20.
//

import Foundation
import XCTest

struct CharacterAddViewControllerHelper {
    
     func testCharacterAddScreen(of app:XCUIApplication) {
        tapAddCharacterBarButton(of: app)
        testResetingFieldsOfCharacter(of: app)
        testSavingCharacter(of: app)
    }
    func tapAddCharacterBarButton(of app:XCUIApplication) {
        app.buttons[Identifiers.addCharacterButtonIdentifier].tap()
    }
    func testSavingCharacter(of app:XCUIApplication) {
        
        app.textFields[Identifiers.addCharacterNameTextFieldIdentifier].tap()
        app.textFields[Identifiers.addCharacterEyeColourTextFieldIdentifier].tap()
        app.textFields[Identifiers.addCharacterHeightTextFieldIdentifier].tap()
        
       
        
        app.buttons[Identifiers.addCharacterSaveButtonIdentifier].tap()
    }
    func testResetingFieldsOfCharacter(of app:XCUIApplication) {
        
        app.textFields[Identifiers.addCharacterNameTextFieldIdentifier].tap()
        app.textFields[Identifiers.addCharacterEyeColourTextFieldIdentifier].tap()
        app.textFields[Identifiers.addCharacterHeightTextFieldIdentifier].tap()
        
        app.buttons[Identifiers.addCharacterResetButtonIdentifier].tap()
        
       
    }
}
