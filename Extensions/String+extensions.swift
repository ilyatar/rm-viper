//
//  String+extensions.swift
//  rm-viper
//
//  Created by Илья Тарасов on 23.07.2020.
//  Copyright © 2020 Илья Тарасов. All rights reserved.
//

import Foundation

extension String {
    
    var utf8Encoded: Data {
        return data(using: .utf8)!
    }

}
