//
//  EpisodesEpisodesConfigurator.swift
//  rm-viper
//
//  Created by Ilya Tarasov on 23/07/2020.
//  Copyright © 2020 Private. All rights reserved.
//

import UIKit

class EpisodesModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? EpisodesViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: EpisodesViewController) {

        let router = EpisodesRouter()

        let presenter = EpisodesPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = EpisodesInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
