//
//  LocationsLocationsPresenter.swift
//  rm-viper
//
//  Created by Ilya Tarasov on 23/07/2020.
//  Copyright © 2020 Private. All rights reserved.
//

class LocationsPresenter: LocationsModuleInput, LocationsViewOutput {

    weak var view: LocationsViewInput!
    var interactor: LocationsInteractorInput!
    var router: LocationsRouterInput!
    var input: ModuleInput?
    var output: ModuleOutput?

    private var nextPage: Int = 0
    private var isFetching: Bool = false
    private var selectedCharacter: CharacterEntity?

    func viewIsReady() {
        input = LocationsRouter.input
        output = LocationsRouter.output
        view.setupInitialState()
    }
    
    func getNextPageLocations() {
        if !isFetching {
            isFetching = true
            interactor.getLocations(nextPage)
        }
    }

}

extension LocationsPresenter: LocationsInteractorOutput {

    func didGetLocations(_ locations: [LocationEntity]?, _ error: ErrorResponse?) {
        isFetching = false
        nextPage += (error == nil ? 1 : 0)
        if let locations = locations, error == nil {
            view.didGetNextPageLocations(locations)
        }
    }

}

extension LocationsPresenter: ModuleInput, ModuleOutput {
    func getInputData() -> Any? {
        return nil
    }

    func didCallback(data: Any?) {
        output?.didCallback(data: data)
    }
}
