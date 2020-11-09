//
//  tableViewController.swift
//  SW Characters
//
//  Created by Mahesh sai on 27/10/20.
//

import Foundation
import UIKit
import Combine


class CharacterListViewController: UITableViewController {
    
    let viewModel = CharacterViewModel()  /// View Model
    
    @IBOutlet weak var addBarButton: UIBarButtonItem! /// Add Character Button
    @IBOutlet weak var reloadBarButton: UIBarButtonItem! /// Reload Characters Button
    /// Section for Diffable Data Source
    enum Section {
        case main
    }
    
    override func viewDidLoad() {
        /// Set Data Source, Delegate and add accesibility Identifiers
        viewModel.delegate = self
        viewModel.loadCharacters()
        self.setCharacterListAccessIdentifiers()
        updateUI(animated: true)
    }
    func updateUI(animated: Bool = true) {
        /// Set Data Source
        tableView.dataSource = dataSource
    }
    
    override func viewWillAppear(_ animated: Bool) {
        /// Load Changes every time view appears
        super.viewWillAppear(animated)
        tableView.tableFooterView = UIView(frame: .zero)
        loadCharacters()
    }
    
    lazy var  dataSource = UITableViewDiffableDataSource<Section,Character>(tableView: tableView ) { (tableview, index, character) -> UITableViewCell? in
        /// Initialize Data Source
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "CharacterCell")
        cell?.accessibilityIdentifier = "CharacterCell"
        cell?.textLabel?.text = character.name
        cell?.textLabel?.numberOfLines = 0
        return cell
    }
    
    // MARK: - Load Characters
    
    func loadCharacters() {
        /// Load Characters and add them to data source
        var snapshot = NSDiffableDataSourceSnapshot<Section, Character>()
        snapshot.appendSections([.main])
        snapshot.appendItems(viewModel.characterArray)
        dataSource.apply(snapshot, animatingDifferences: true)
    }
    
    // MARK: - Show Detail of Selected Character
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let selectedCharacter = dataSource.itemIdentifier(for: indexPath) {
            viewModel.selectedChar = selectedCharacter
            moveToCharaterDetailView()
        }
    }
    func moveToCharaterDetailView() {
        performSegue(withIdentifier: "CharacterDetail", sender: self)
    }
    // MARK: - Add Character
    
    @IBAction func addCharacter(_ sender: Any) {
        
        moveToAddCharacterView()
    }
    func moveToAddCharacterView() {
        performSegue(withIdentifier: "addCharacter", sender: self)
    }
    // MARK: - Reload Characters
    @IBAction func reloadCharacters(_ sender: Any) {
        viewModel.loadCharacters()
    }
    
    // MARK: - Pass The Information To Next View
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "addCharacter") {
            let destination = segue.destination as! CharacterAddViewController
            destination.viewModel = self.viewModel
            
        }
        else if(segue.identifier == "CharacterDetail") {
            let destination = segue.destination as! CharacterDetailViewController
            destination.viewModel = self.viewModel
        }
    }
    
    // MARK: - Set Access Identifiers
    
    func setCharacterListAccessIdentifiers() {
        /// Set identifiers for UI elemets
        self.tableView.accessibilityIdentifier = Identifiers.tableIdentifier
        self.addBarButton.accessibilityIdentifier = Identifiers.addCharacterButtonIdentifier
        self.reloadBarButton.accessibilityIdentifier = Identifiers.reloadCharacterButtonIdentifier
    }
    
}

// MARK: - Loading Characters Completed

extension CharacterListViewController: communicateToConfirmDelegate {
    func loadCharactersCompleted() {
        self.loadCharacters()
    }
}

