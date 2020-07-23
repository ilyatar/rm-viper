//
//  Service.swift
//  rm-viper
//
//  Created by Илья Тарасов on 23.07.2020.
//  Copyright © 2020 Илья Тарасов. All rights reserved.
//

import Foundation

protocol Service: class {
    var identifier: String { get set }
}

extension Service {
    func generate() {
        if identifier.isEmpty {
            identifier = UUID().uuidString
        }
    }
    
    func started() {
        ServicesManager.manager.add(service: self)
    }
    
    func finished() {
        ServicesManager.manager.remove(service: self)
    }

}
