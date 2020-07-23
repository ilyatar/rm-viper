//
//  CharactersCharactersConfigurator.swift
//  rm-viper
//
//  Created by Ilya Tarasov on 23/07/2020.
//  Copyright © 2020 Private. All rights reserved.
//

import UIKit

class CharactersModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? CharactersViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: CharactersViewController) {

        let router = CharactersRouter()

        let presenter = CharactersPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = CharactersInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
