//
//  CharacterJSON.swift
//  SW Characters
//
//  Created by Mahesh sai on 27/10/20.
//

import Foundation

struct character:Codable
{
    let name:String
    let height:String
    let eye_color:String
}
struct results:Codable {
    let results:[character]
}
