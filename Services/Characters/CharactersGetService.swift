//
//  CharactersGetService.swift
//  rm-viper
//
//  Created by Илья Тарасов on 23.07.2020.
//  Copyright © 2020 Илья Тарасов. All rights reserved.
//

import Moya

class CharactersGetService: Service {
    
    var identifier: String = ""
    
    var page: Int?
        
    init(page: Int?) {
        self.page = page
        
        generate()
    }
    
    func run(completion: @escaping ((_ result: [CharacterEntity]?, _ error: ErrorResponse?) -> Void)) {
        started()
        
        let provider: MoyaProvider<CharactersProvider> = BaseProvider.getProvider()

        provider.request(.getCharacters(page)) {[weak self] result in
            switch result {
            case let .success(response):
                if let characters = CharactersParser.parseCharacters(data: response.data) {
                    completion(characters, nil)
                } else {
                    let error = ErrorParser.parseError(data: response.data)
                    completion(nil, error)
                }
                self?.finished()
            case let .failure(error):
                completion(nil, ErrorResponse(code: error.errorCode, message: error.localizedDescription))
                self?.finished()
            }
        }
        
    }
}

