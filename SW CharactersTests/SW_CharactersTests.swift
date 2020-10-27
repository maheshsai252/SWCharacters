//
//  SW_CharactersTests.swift
//  SW CharactersTests
//
//  Created by Mahesh sai on 27/10/20.
//

import XCTest
@testable import SW_Characters

class SW_CharactersTests: XCTestCase {
    var vm:characterVM!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        vm=characterVM()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        vm=nil
    }

    func testAdd()
    {
        let c=vm.characterArray.count
        vm.add(name: "oiu", height: "120", eyeColor: "blue")
        XCTAssertEqual(vm.characterArray.count,c+1 , "added")
        
    }
    func testRemove()
    {
        
        vm.add(name: "oiu", height: "120", eyeColor: "blue")
        let c=vm.characterArray.count
        vm.selectedChar=vm.characterArray[0]
        vm.remove()
        XCTAssertEqual(vm.characterArray.count,c-1 , "removed")
    }


}
