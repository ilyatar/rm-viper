//
//  TabBarTabBarConfigurator.swift
//  rm-viper
//
//  Created by Ilya Tarasov on 23/07/2020.
//  Copyright © 2020 Private. All rights reserved.
//

import UIKit

class TabBarModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? TabBarViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: TabBarViewController) {

        let router = TabBarRouter()

        let presenter = TabBarPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = TabBarInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter        
    }

}
