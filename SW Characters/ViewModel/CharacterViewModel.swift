//
//  characterVM.swift
//  SW Characters
//
//  Created by Mahesh sai on 27/10/20.
//

import Foundation
import Combine
// MARK: - Character

struct Character:Hashable
{
    let name:String
    let eyeColor:String
    let height:String
}
protocol communicateToConfirmDelegate
{
    func loadCharactersCompleted()
}
class CharacterViewModel
{
    var characterArray:[Character] = []
    var subscriptions: Set<AnyCancellable> = []
    var selectedChar:Character?
    var delegate:communicateToConfirmDelegate?
    var apiManager = APIManager(url: Identifiers.url)
    // MARK: - Load Characters From API
    
    func loadCharacters()
    {
        apiManager.loadCharactersFromURL()
            .receive(on: DispatchQueue.main)
            .sink
            { (completion) in
                switch completion
                {
                case .finished:
                    print("good")
                case .failure(let error):
                    print(error)
                
                }
            } receiveValue:
            { [self] (result) in
                
                for character in result.results
                {
                    let characterResult = Character(name: character.name, eyeColor: character.eye_color, height: character.height)
                    if(!characterArray.contains(characterResult)) {
                        self.characterArray.append(characterResult)
                    }
                   
                }
                self.delegate?.loadCharactersCompleted()
            }
            .store(in: &subscriptions)
    }
    // MARK: - Add Character
    
    func addCharacter(name:String,height:String,eyeColor:String)
    {
        if(!name.isEmpty && !height.isEmpty && !eyeColor.isEmpty) {
        let character = Character(name: name, eyeColor: eyeColor, height: height)
        
        self.characterArray.append(character)
        }
    }
    // MARK: - Remove Character
    
    func removeCharacter()
    {
        if let character = self.selectedChar
        {

        if let index = self.characterArray.firstIndex(of: character)
        {
            self.characterArray.remove(at: index)
            
        }
        }
     
    }
    
}

// MARK: - TO check if height is a number

extension String {

    var isNumeric : Bool {
        return NumberFormatter().number(from: self) != nil
    }

}
