//
//  EpisodesGetService.swift
//  rm-viper
//
//  Created by Илья Тарасов on 23.07.2020.
//  Copyright © 2020 Илья Тарасов. All rights reserved.
//

import Moya

class EpisodesGetService: Service {
    
    var identifier: String = ""
    
    var page: Int?
        
    init(page: Int?) {
        self.page = page
        
        generate()
    }
    
    func run(completion: @escaping ((_ result: [EpisodeEntity]?, _ error: ErrorResponse?) -> Void)) {
        started()
        
        let provider: MoyaProvider<EpisodesProvider> = BaseProvider.getProvider()

        provider.request(.getEpisodes(page)) {[weak self] result in
            switch result {
            case let .success(response):
                if let episodes = EpisodesParser.parseEpisodes(data: response.data) {
                    completion(episodes, nil)
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

