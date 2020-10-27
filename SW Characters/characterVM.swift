//
//  characterVM.swift
//  SW Characters
//
//  Created by Mahesh sai on 27/10/20.
//

import Foundation
import Combine
struct characterProto:Hashable
{
    let name:String
    let eyeColor:String
    let height:String
}
protocol communicateDelegate
{
    func communicate()
}
class characterVM {
    var characterArray:[characterProto]=[]
    var subscriptions: Set<AnyCancellable> = []
    var selectedChar:characterProto?
    var delegate:communicateDelegate?
    func loadCharacters()
    {
       
        print("initializig")
        LoadHelper.loadFromAPI()
            .receive(on: DispatchQueue.main)
            .sink { (completion) in
                switch completion
                {
                case .finished:
                    print("good")
                case .failure(let error):
                    print(error)
                
                }
            } receiveValue:
            { (result) in
                
                for character in result.results
                {
                    let temp=characterProto(name: character.name, eyeColor: character.eye_color, height: character.height)
                    self.characterArray.append(temp)
                }
                self.delegate?.communicate()
            }
            .store(in: &subscriptions)
    }
    func add(name:String,height:String,eyeColor:String)
    {
        let temp=characterProto(name: name, eyeColor: eyeColor, height: height)
        print(temp)
        self.characterArray.append(temp)
        print(characterArray)
    }
    func remove()
    {
        
        
        let ri=self.characterArray.firstIndex(of: self.selectedChar!)!
        
        self.characterArray.remove(at: ri)
    }
    
}
