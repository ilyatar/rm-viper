//
//  CharactersCharactersViewController.swift
//  rm-viper
//
//  Created by Ilya Tarasov on 23/07/2020.
//  Copyright © 2020 Private. All rights reserved.
//

import UIKit

class CharactersViewController: UIViewController {

    var output: CharactersViewOutput!
    
    @IBOutlet weak var tableView: UITableView!
    var dataSource = [CharacterEntity]()
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }

    func configureUI() {
        navigationController?.transparentNavigationBar()
        navigationController?.navigationBar.prefersLargeTitles = true
        configureTableView()
        nextPage()
    }

    func nextPage() {
        output.getNextPageCharacters()
    }
    
    private func updateTableView(_ characters: [CharacterEntity]) {
        if !characters.isEmpty {
            let startIx = dataSource.count
            let indexPaths: [IndexPath] = characters.enumerated().map{IndexPath(row: $0.offset + startIx, section: 0)}
            dataSource.append(contentsOf: characters)
            tableView.insertRows(at: indexPaths, with: .automatic)
        }
    }
}

extension CharactersViewController: CharactersViewInput {

    // MARK: CharactersViewInput
    func setupInitialState() {
        configureUI()
    }

    func beginProgress(completion: (() -> Void)?) {
        completion?()
    }

    func endProgress(completion: (() -> Void)?) {
        completion?()
    }

    func didGetNextPageCharacters(_ characters: [CharacterEntity]) {
        updateTableView(characters)
    }

}
