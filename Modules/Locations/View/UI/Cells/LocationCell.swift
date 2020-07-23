//
//  LocationCell.swift
//  rm-viper
//
//  Created by Илья Тарасов on 23.07.2020.
//  Copyright © 2020 Илья Тарасов. All rights reserved.
//

import UIKit

class LocationCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    
    static let kReuseIdentifier = "LocationCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func updateLocation(_ location: LocationEntity, tag: Int) {
        nameLabel.text = location.name
        typeLabel.text = location.type
    }
    
}
