//
//  CharactersCharactersInteractor.swift
//  rm-viper
//
//  Created by Ilya Tarasov on 23/07/2020.
//  Copyright © 2020 Private. All rights reserved.
//

import Moya

class CharactersInteractor: CharactersInteractorInput {

    weak var output: CharactersInteractorOutput!

    func getCharacters(_ page: Int?) {
        let service = CharactersGetService(page: page)
        service.run {[weak self] (characters, error) in
            self?.output.didGetCharacters(characters, error)
        }
    }
    
}
