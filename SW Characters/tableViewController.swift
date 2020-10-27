//
//  tableViewController.swift
//  SW Characters
//
//  Created by Mahesh sai on 27/10/20.
//

import Foundation
import UIKit
import Combine
class mainTableController:UITableViewController
{
    
    @IBAction func addCharacter(_ sender: Any)
    {
        
        performSegue(withIdentifier: "addCharacter", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier=="addCharacter")
        {
            let dc=segue.destination as! AddCharacter
            dc.vm=self.vm
            
        }
        else if(segue.identifier=="CharacterDetail")
        {
            let dc=segue.destination as! CharacterDetail
            dc.vm=self.vm
        }
    }
    let vm=characterVM()
    enum Section
    {
        case main
    }
    
    override func viewDidLoad()
    {
        vm.delegate=self
        vm.loadCharacters()
        self.tableView.accessibilityIdentifier="CharacterList"
        print(vm.characterArray)
        tableView.dataSource=ds
        
    }
    override func viewWillAppear(_ animated: Bool) {
        tableView.tableFooterView = UIView(frame: .zero)
        load()
    }
    func load()
    {
        var snapshot=NSDiffableDataSourceSnapshot<Section, characterProto>()
        snapshot.appendSections([.main])
        snapshot.appendItems(vm.characterArray)
        ds.apply(snapshot, animatingDifferences: true)
    }
    lazy var  ds=UITableViewDiffableDataSource<Section,characterProto>(tableView: tableView )
    { (tableview, index, char) -> UITableViewCell? in
        let cell=self.tableView.dequeueReusableCell(withIdentifier: "CharacterCell")
        cell?.textLabel?.text=char.name
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedChar=ds.itemIdentifier(for: indexPath)!
        vm.selectedChar=selectedChar
        performSegue(withIdentifier: "CharacterDetail", sender: self)
        
    }
    
}
extension mainTableController:communicateDelegate
{
    func communicate()
    {
        self.load()
    }
    
}

