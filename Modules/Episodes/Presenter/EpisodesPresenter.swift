//
//  EpisodesEpisodesPresenter.swift
//  rm-viper
//
//  Created by Ilya Tarasov on 23/07/2020.
//  Copyright © 2020 Private. All rights reserved.
//

class EpisodesPresenter: EpisodesModuleInput, EpisodesViewOutput {

    weak var view: EpisodesViewInput!
    var interactor: EpisodesInteractorInput!
    var router: EpisodesRouterInput!
    var input: ModuleInput?
    var output: ModuleOutput?

    func viewIsReady() {
        input = EpisodesRouter.input
        output = EpisodesRouter.output
        view.setupInitialState()
    }
}

extension EpisodesPresenter: EpisodesInteractorOutput {

}

extension EpisodesPresenter: ModuleInput, ModuleOutput {
    func getInputData() -> Any? {
        return nil
    }

    func didCallback(data: Any?) {
        output?.didCallback(data: data)
    }
}
