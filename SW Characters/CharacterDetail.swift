//
//  CharacterDetail.swift
//  SW Characters
//
//  Created by Mahesh sai on 27/10/20.
//

import Foundation
import CoreGraphics
import UIKit
class CharacterDetail:UIViewController
{
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var eye: UILabel!
    @IBOutlet weak var height: UILabel!
    var vm:characterVM?
    override func viewWillAppear(_ animated: Bool) {
        name.text=vm?.selectedChar?.name
        eye.text=vm?.selectedChar?.eyeColor
        height.text=vm?.selectedChar?.height
        let t=vm?.selectedChar?.name
        let size:CGFloat = 35.0 // 35.0 chosen arbitrarily

        countLabel.bounds = CGRect(x: 0.0, y: 0.0, width: size, height: size)
        countLabel.layer.cornerRadius = size / 2
        countLabel.layer.borderWidth = 3.0
        countLabel.layer.backgroundColor = UIColor.white.cgColor
        countLabel.layer.borderColor = UIColor.green.cgColor
        countLabel.text=String(t!.prefix(1))
        countLabel.textColor = .red
            
    }
    
    
   
    @IBAction func deletePressed(_ sender: Any) {
        vm?.remove()
        _ = navigationController?.popViewController(animated: true)
    }
    
    
}
