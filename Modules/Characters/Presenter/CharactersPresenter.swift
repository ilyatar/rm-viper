//
//  CharactersCharactersPresenter.swift
//  rm-viper
//
//  Created by Ilya Tarasov on 23/07/2020.
//  Copyright © 2020 Private. All rights reserved.
//

class CharactersPresenter: CharactersModuleInput, CharactersViewOutput {

    weak var view: CharactersViewInput!
    var interactor: CharactersInteractorInput!
    var router: CharactersRouterInput!
    var input: ModuleInput?
    var output: ModuleOutput?

    private var nextPage: Int = 0
    private var isFetching: Bool = false
    private var selectedCharacter: CharacterEntity?
    
    func viewIsReady() {
        input = CharactersRouter.input
        output = CharactersRouter.output
        view.setupInitialState()
    }
    
    func getNextPageCharacters() {
        if !isFetching {
            isFetching = true
            interactor.getCharacters(nextPage)
        }
    }
    
    func showDetail(_ character: CharacterEntity) {
        selectedCharacter = character
        RootCoordinator.shared.show(.detailCharacter(input: self, output: self))
    }
    
}

extension CharactersPresenter: CharactersInteractorOutput {
    
    func didGetCharacters(_ characters: [CharacterEntity]?, _ error: ErrorResponse?) {
        isFetching = false
        nextPage += (error == nil ? 1 : 0)
        if let characters = characters, error == nil {
            view.didGetNextPageCharacters(characters)
        }
    }
    
}

extension CharactersPresenter: ModuleInput, ModuleOutput {
    func getInputData() -> Any? {
        return ["CharacterEntity": selectedCharacter]
    }

    func didCallback(data: Any?) {
        output?.didCallback(data: data)
    }
}
