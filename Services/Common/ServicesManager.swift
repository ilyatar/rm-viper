//
//  ServicesManager.swift
//  rm-viper
//
//  Created by Илья Тарасов on 23.07.2020.
//  Copyright © 2020 Илья Тарасов. All rights reserved.
//

import Foundation

class ServicesManager {
    
    static let manager = ServicesManager()
    
    private var services: [String: Service]
    
    fileprivate init() {
        services = [:]
    }
    
    func add(service: Service) {
        if service.identifier.isEmpty {
            return
        }
        
        services[service.identifier] = service
    }
    
    func remove(service: Service) {
        if service.identifier.isEmpty {
            return
        }

        services[service.identifier] = nil
    }
}
