//
//  LocationsLocationsInteractor.swift
//  rm-viper
//
//  Created by Ilya Tarasov on 23/07/2020.
//  Copyright © 2020 Private. All rights reserved.
//

import Moya

class LocationsInteractor: LocationsInteractorInput {

    weak var output: LocationsInteractorOutput!

    func getLocations(_ page: Int?) {
        let service = LocationsGetService(page: page)
        service.run {[weak self] (locations, error) in
            self?.output.didGetLocations(locations, error)
        }
    }

}
