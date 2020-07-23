//
//  DetailCharacterDetailCharacterPresenter.swift
//  rm-viper
//
//  Created by Ilya Tarasov on 23/07/2020.
//  Copyright © 2020 Private. All rights reserved.
//

class DetailCharacterPresenter: DetailCharacterModuleInput, DetailCharacterViewOutput {

    weak var view: DetailCharacterViewInput!
    var interactor: DetailCharacterInteractorInput!
    var router: DetailCharacterRouterInput!
    var input: ModuleInput?
    var output: ModuleOutput?
    
    var character: CharacterEntity?

    func viewIsReady() {
        input = DetailCharacterRouter.input
        output = DetailCharacterRouter.output
        
        character = (input?.getInputData() as? [String: Any])?["CharacterEntity"] as? CharacterEntity
        
        view.setupInitialState()
    }
}

extension DetailCharacterPresenter: DetailCharacterInteractorOutput {

}

extension DetailCharacterPresenter: ModuleInput, ModuleOutput {
    func getInputData() -> Any? {
        return nil
    }

    func didCallback(data: Any?) {
        output?.didCallback(data: data)
    }
}
