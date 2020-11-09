//
//  CharacterListViewControllerHelper.swift
//  SW Characters
//
//  Created by Mahesh sai on 09/11/20.
//

import Foundation
import XCTest

struct CharacterListViewControllerHelper {
    
     func testCharacterListScreen(of app:XCUIApplication) {
        testTableView(of: app)
        testNavigationBarItems(of: app)
    }
    func testTableView(of app:XCUIApplication) {
        app.tables[Identifiers.tableIdentifier].tap()
    }
    func testNavigationBarItems(of app:XCUIApplication) {
       // app.buttons[Identifiers.addCharacterButtonIdentifier]
        app.navigationBars.buttons.element(boundBy: 0).tap()
        app.buttons[Identifiers.reloadCharacterButtonIdentifier].tap()
    }
}
