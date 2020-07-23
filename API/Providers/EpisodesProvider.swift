//
//  EpisodesProvider.swift
//  rm-viper
//
//  Created by Илья Тарасов on 23.07.2020.
//  Copyright © 2020 Илья Тарасов. All rights reserved.
//

import Moya

enum EpisodesProvider {
    case getEpisodes(_ page: Int?)
}

extension EpisodesProvider: TargetType {
    var baseURL: URL {
        return Constant.baseUrl
    }
    
    var path: String {
        switch self {
        case .getEpisodes:
            return "/episode"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getEpisodes:
            return .get
        }
    }
    
    var sampleData: Data {
        return "Not implemented".utf8Encoded
    }
    
    var task: Task {
        switch self {
        case let .getEpisodes(page):
            if let page = page {
                return .requestParameters(parameters: ["page": page], encoding: URLEncoding.queryString)
            } else {
                return .requestPlain
            }
        }
    }
    
    var headers: [String : String]? {
        return [
            "Content-type": "application/json",
            "Accept": "application/json"
        ]
    }
    
}
