//
//  AddCharacter.swift
//  SW Characters
//
//  Created by Mahesh sai on 27/10/20.
//

import Foundation
import UIKit
class CharacterAddViewController: UIViewController {
    
    @IBOutlet weak var nameField: UITextField! ///  Name Text Field

    @IBOutlet weak var eyeField: UITextField!  /// Eye Text Field
    
    @IBOutlet weak var heightField: UITextField!  /// Height Text Field
    
    @IBOutlet weak var saveButton: UIButton!    /// Save Button
    @IBOutlet weak var resetButton: UIBarButtonItem! /// Reset Button
    var viewModel:CharacterViewModel? /// View Model
    
    override func viewDidLoad() {
        /// Set border colours and add accesibilty identifiers
        nameField.layer.borderColor = UIColor.black.cgColor
        eyeField.layer.borderColor = UIColor.black.cgColor
        heightField.layer.borderColor = UIColor.black.cgColor
        addAccesibilityIdentifiers()
    }
    // MARK: - End Editing
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        /// End Editing if user taps anyehere
        nameField.endEditing(true)
        eyeField.endEditing(true)
        heightField.endEditing(true)
    }
    
    // MARK: - Save Character
    
    @IBAction func save(_ sender: Any) {
        /// Save Character
        saveCharacter()
    }
    
    
    @IBAction func resetAllFields(_ sender: Any) {
        ///Reset The TextField Values
        cleanAllFields()
    }
    func saveCharacter() {
        /// Unwrap values from Text Fields and check if they are empty or not
        if let viewModelUnWrapped = viewModel, let characterName = nameField.text, let characterHeight = heightField.text, let characterEye = eyeField.text {
            if !characterName.isEmpty && !characterEye.isEmpty && !characterHeight.isEmpty {
                /// Add the character to array if not all the fields are empty
                viewModelUnWrapped.addCharacter(name: characterName, height: characterHeight, eyeColor: characterEye)
                cleanAllFields()
                /// Go Back to the Main Screen
                _ = navigationController?.popViewController(animated: true)
            }
            else {
                /// Alert the user if text fields are empty
                presentAlertController()
            }
        }
    }
    func presentAlertController() {
        /// Alert the user to enter all the fields
        let alertController = UIAlertController(title: "Not Accepted", message:
                                                    "All Fields Should be filled", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alertController, animated: true, completion: nil)
    }
    
    func cleanAllFields() {
        /// Clear all Text Fields
        nameField.text = ""
        heightField.text = ""
        eyeField.text = ""
    }
    func addAccesibilityIdentifiers() {
        /// Set the accesibility identifiers for each label and bar buttons
        nameField.accessibilityIdentifier = Identifiers.addCharacterNameTextFieldIdentifier
        eyeField.accessibilityIdentifier = Identifiers.addCharacterEyeColourTextFieldIdentifier
        heightField.accessibilityIdentifier = Identifiers.addCharacterHeightTextFieldIdentifier
        saveButton.accessibilityIdentifier = Identifiers.addCharacterSaveButtonIdentifier
        resetButton.accessibilityIdentifier = Identifiers.addCharacterResetButtonIdentifier
    }
}
