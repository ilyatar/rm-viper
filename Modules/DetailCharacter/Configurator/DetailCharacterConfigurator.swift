//
//  DetailCharacterDetailCharacterConfigurator.swift
//  rm-viper
//
//  Created by Ilya Tarasov on 23/07/2020.
//  Copyright © 2020 Private. All rights reserved.
//

import UIKit

class DetailCharacterModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? DetailCharacterViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: DetailCharacterViewController) {

        let router = DetailCharacterRouter()

        let presenter = DetailCharacterPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = DetailCharacterInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
