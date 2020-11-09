//
//  CharacterDetail.swift
//  SW Characters
//
//  Created by Mahesh sai on 27/10/20.
//

import Foundation
import CoreGraphics
import UIKit

class CharacterDetailViewController: UIViewController { 
    
    @IBOutlet weak var name: UILabel!  /// Name Label
   
    @IBOutlet weak var headerLabel: UILabel!  /// Header Label
    @IBOutlet weak var eye: UILabel!    /// Eye Label
    @IBOutlet weak var height: UILabel!  /// Height Label
    
    @IBOutlet weak var removeCharacterButton: UIBarButtonItem! ///  Delete Bar Button
    
    var viewModel: CharacterViewModel? /// View Model
    
    override func viewDidLoad() {
        /// Add Accessibility Identifiers
        addAccessiblityIdentifiers()
    }
    override func viewWillAppear(_ animated: Bool) {
        /// Set the values of each label using selected character properties in View Model
        name.text = viewModel?.selectedChar?.name
        name.numberOfLines = 0
        eye.text = viewModel?.selectedChar?.eyeColor
        eye.numberOfLines = 0
        height.text = viewModel?.selectedChar?.height
        height.numberOfLines = 0
        /// Set the Header Label with FIrst Letter of Character and add Circle arround the letter
        let nameOfCharacter = viewModel?.selectedChar?.name
        let size:CGFloat = 35.0 

        headerLabel.bounds = CGRect(x: 0.0, y: 0.0, width: size, height: size)
        headerLabel.layer.cornerRadius = size / 2
        headerLabel.layer.borderWidth = 3.0
        headerLabel.layer.backgroundColor = UIColor.white.cgColor
        headerLabel.layer.borderColor = UIColor.green.cgColor
        
        if let characterName = nameOfCharacter
        {
        headerLabel.text = String(characterName.prefix(1))
        }
        headerLabel.textColor = .red
            
    }
    
    
    // MARK: - Delete Character
    
    @IBAction func deletePressed(_ sender: Any) {
       removeCharacter()
    }
    
    func removeCharacter() {
        /// Remove character from array in view model
        viewModel?.removeCharacter()
        _ = navigationController?.popViewController(animated: true)
    }
    func addAccessiblityIdentifiers() {
        /// Set the accesibility identifiers for each label and bar buttons
        name.accessibilityIdentifier = Identifiers.characterDetailNameLabel
        eye.accessibilityIdentifier = Identifiers.characterDetailEyeLabel
        height.accessibilityIdentifier = Identifiers.characterDetailHeightLabel
        removeCharacterButton.accessibilityIdentifier = Identifiers.characterDetailRemoveButtonIdentifier
    }
}
