//
//  LocationsViewController+collection.swift
//  rm-viper
//
//  Created by Илья Тарасов on 23.07.2020.
//  Copyright © 2020 Илья Тарасов. All rights reserved.
//

import UIKit

extension LocationsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func configureTableView() {
        tableView?.register(UINib(nibName: LocationCell.kReuseIdentifier, bundle: nil), forCellReuseIdentifier: LocationCell.kReuseIdentifier)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: LocationCell.kReuseIdentifier, for: indexPath) as! LocationCell
        
        let location = dataSource[indexPath.row]
        cell.updateLocation(location, tag: indexPath.row)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if !(indexPath.row + 1 < dataSource.count) {
            nextPage()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
