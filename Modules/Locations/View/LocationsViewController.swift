//
//  LocationsLocationsViewController.swift
//  rm-viper
//
//  Created by Ilya Tarasov on 23/07/2020.
//  Copyright © 2020 Private. All rights reserved.
//

import UIKit

class LocationsViewController: UIViewController {

    var output: LocationsViewOutput!

    @IBOutlet weak var tableView: UITableView!
    var dataSource = [LocationEntity]()

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
        output.getNextPageLocations()
    }
    
    private func updateTableView(_ locations: [LocationEntity]) {
        if !locations.isEmpty {
            let startIx = dataSource.count
            let indexPaths: [IndexPath] = locations.enumerated().map{IndexPath(row: $0.offset + startIx, section: 0)}
            dataSource.append(contentsOf: locations)
            tableView.insertRows(at: indexPaths, with: .automatic)
        }
    }

}

extension LocationsViewController: LocationsViewInput {

    // MARK: LocationsViewInput
    func setupInitialState() {
        configureUI()
    }

    func beginProgress(completion: (() -> Void)?) {
        completion?()
    }

    func endProgress(completion: (() -> Void)?) {
        completion?()
    }

    func didGetNextPageLocations(_ locations: [LocationEntity]) {
        updateTableView(locations)
    }

}
