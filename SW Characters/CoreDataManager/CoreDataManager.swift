//
//  CDM.swift
//  SW Characters
//
//  Created by Mahesh sai on 28/10/20.
//

import Foundation
import UIKit
import CoreData
class CoreDataManager
{
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    // MARK: - Add Character
    
    func addCharacter(name:String,height:String,eye_Color:String)
    {
        let character = CharacterCore(context: context)
        character.eyeColor = eye_Color
        character.name = name
        character.height = height
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
    }
    // MARK: - Retrieve Characters

    func retreiveCharacters()->[CharacterCore]
    {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "CharacterCore")
        var characters:[CharacterCore]=[]
        do
        {
            characters = try context.fetch(fetchRequest) as! [CharacterCore]
            
        }
        catch
        {
            print(error)
        }
        return characters
        
    }
    // MARK: - Remove Character

    func remove(character item:CharacterCore)
    {
        context.delete(item)
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
    }
    func removeCharacter(with name:String)
    {
        let fr = NSFetchRequest<NSFetchRequestResult>(entityName: "CharacterCore")
        let predicate = NSPredicate(format: "name = %@",name)
        fr.predicate = predicate
        do
        {
        let items = try context.fetch(fr) as! [CharacterCore]
        context.delete(items[0])
        }
        catch
        {
            print(error)
        }
        
    }

}
