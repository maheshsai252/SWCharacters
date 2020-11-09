//
//  SW_CharactersTests.swift
//  SW CharactersTests
//
//  Created by Mahesh sai on 27/10/20.
//

import XCTest
@testable import SW_Characters

class SW_CharactersTests: XCTestCase {
    var viewModel:CharacterViewModel!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        viewModel = CharacterViewModel()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        viewModel = nil
    }
    // MARK: - Test Add Character

    func testAddCharacter()
    {
        let count = viewModel.characterArray.count
        viewModel.addCharacter(name: "oiu", height: "120", eyeColor: "blue")
        XCTAssertEqual(viewModel.characterArray.count,count+1 , "added")
        
    }
    
    func testAddCharacterWithEmptyValues()
    {
        let count = viewModel.characterArray.count
        viewModel.addCharacter(name: "", height: "", eyeColor: "")
        XCTAssertEqual(viewModel.characterArray.count,count , "Not Added")
        
    }
    
    
    // MARK: - Test Remove Character

    func testRemoveCharacter()
    {
        
        viewModel.addCharacter(name: "oiu", height: "120", eyeColor: "blue")
        let count = viewModel.characterArray.count
        viewModel.selectedChar=viewModel.characterArray[0]
        viewModel.removeCharacter()
        XCTAssertEqual(viewModel.characterArray.count,count-1 , "removed")
    }


}
