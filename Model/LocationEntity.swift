//
//  LocationEntity.swift
//  rm-viper
//
//  Created by Илья Тарасов on 23.07.2020.
//  Copyright © 2020 Илья Тарасов. All rights reserved.
//

import UIKit

public class LocationEntity: Codable {
        
    var id: Int?
    var name: String?
    var type: String?
    var dimension: String?
    var residents: [String]?
    var url: String?
    var created: String?
    
}
