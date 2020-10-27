//
//  AddCharacter.swift
//  SW Characters
//
//  Created by Mahesh sai on 27/10/20.
//

import Foundation
import UIKit
class AddCharacter:UIViewController
{
    
    @IBOutlet weak var nameField: UITextField!

    @IBOutlet weak var eyeField: UITextField!
    
    @IBOutlet weak var heightField: UITextField!
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        nameField.endEditing(true)
        eyeField.endEditing(true)
        heightField.endEditing(true)
    }
    var vm:characterVM?
    @IBAction func save(_ sender: Any) {
        vm!.add(name: nameField.text!, height: heightField.text!, eyeColor: eyeField.text!)
        nameField.text=""
        heightField.text=""
        eyeField.text=""
        _ = navigationController?.popViewController(animated: true)
    }
}
