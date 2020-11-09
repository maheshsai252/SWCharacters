//
//  CharacterJSON.swift
//  SW Characters
//
//  Created by Mahesh sai on 27/10/20.
//

import Foundation

struct CharacterJSON:Codable
{
    let name:String
    let height:String
    let eye_color:String
}

struct Results:Codable {
    let results:[CharacterJSON]
}
