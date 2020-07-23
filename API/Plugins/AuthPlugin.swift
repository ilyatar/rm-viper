//
//  AuthPlugin.swift
//  rm-viper
//
//  Created by Ilya Tarasov on 23/07/2020.
//  Copyright © 2020 Private. All rights reserved.
//

import Moya
//import Result

struct AuthPlugin: PluginType {
    let token: String?
    
    func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
        if let _token = token, !_token.isEmpty {
            var _request = request
            _request.addValue("Bearer " + _token, forHTTPHeaderField: "Authorization")
            return _request
        }
        return request
    }

    func didReceive(_ result: Result<Response, MoyaError>, target: TargetType) {
        do {
            let response = try result.get()

            //TODO глобальный обработчик ошибок с сервера
            if response.statusCode == 401 {
            }
        } catch let error {
            print(error.localizedDescription)
        }
    }

}
