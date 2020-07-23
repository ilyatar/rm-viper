//
//  GuideProvider.swift
//  rm-viper
//
//  Created by Ilya Tarasov on 23/07/2020.
//  Copyright © 2020 Private. All rights reserved.
//

import Moya

enum CharactersProvider {
    case getCharacters(_ page: Int?)
}

extension CharactersProvider: TargetType {
    var baseURL: URL {
        return Constant.baseUrl
    }
    
    var path: String {
        switch self {
        case .getCharacters:
            return "/character"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getCharacters:
            return .get
        }
    }
    
    var sampleData: Data {
        return "Not implemented".utf8Encoded
    }
    
    var task: Task {
        switch self {
        case let .getCharacters(page):
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
