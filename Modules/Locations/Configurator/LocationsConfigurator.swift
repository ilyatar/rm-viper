//
//  LocationsLocationsConfigurator.swift
//  rm-viper
//
//  Created by Ilya Tarasov on 23/07/2020.
//  Copyright © 2020 Private. All rights reserved.
//

import UIKit

class LocationsModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? LocationsViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: LocationsViewController) {

        let router = LocationsRouter()

        let presenter = LocationsPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = LocationsInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
