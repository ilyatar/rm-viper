//
//  LocationsViewInput.swift
//  rm-viper
//
//  Created by Ilya Tarasov on 23/07/2020.
//  Copyright © 2020 Private. All rights reserved.
//

protocol LocationsViewInput: class {

    /**
        @author Ilya Tarasov
        Setup initial state of the view
    */

    func setupInitialState()
    func beginProgress(completion: (() -> Void)?)
    func endProgress(completion: (() -> Void)?)
    
    func didGetNextPageLocations(_ locations: [LocationEntity])
}
