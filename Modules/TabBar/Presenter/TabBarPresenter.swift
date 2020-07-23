//
//  TabBarTabBarPresenter.swift
//  rm-viper
//
//  Created by Ilya Tarasov on 23/07/2020.
//  Copyright © 2020 Private. All rights reserved.
//

class TabBarPresenter: TabBarModuleInput, TabBarViewOutput {

    weak var view: TabBarViewInput!
    var interactor: TabBarInteractorInput!
    var router: TabBarRouterInput!
    var input: ModuleInput?
    var output: ModuleOutput?

    func viewIsReady() {
        input = TabBarRouter.input
        output = TabBarRouter.output
        view.setupInitialState()
    }
}

extension TabBarPresenter: TabBarInteractorOutput {

}

extension TabBarPresenter: ModuleInput, ModuleOutput {
    func getInputData() -> Any? {
        return nil
    }

    func didCallback(data: Any?) {
        output?.didCallback(data: data)
    }
}
