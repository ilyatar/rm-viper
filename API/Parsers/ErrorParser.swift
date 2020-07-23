//
//  ErrorParser.swift
//  rm-viper
//
//  Created by Ilya Tarasov on 23/07/2020.
//  Copyright © 2020 Private. All rights reserved.
//

import Foundation

struct ErrorResponse: Decodable {
    let code: Int
    let message: String
}

struct ErrorPropertyResponse: Decodable {
    let property_path: String
    let message: String
    
    var description: String {
        get {
            return message
        }
    }
}

extension ErrorResponse {
    
    var description: String {
        get {
            return String(code) + " " + message
        }
    }
}

class ErrorParser {
    
    class func parseError(data: Data?) -> ErrorResponse? {
        guard let _data = data else { return nil }
        
        let decoder = JSONDecoder()
        guard let obj = try? decoder.decode(ErrorResponse.self, from: _data) else { return nil }
        
        return obj
    }

    class func parsePropertiesError(data: Data?) -> [ErrorPropertyResponse]? {
        guard let _data = data else { return nil }
        
        let decoder = JSONDecoder()
        guard let obj = try? decoder.decode([ErrorPropertyResponse].self, from: _data) else { return nil }
        
        return obj
    }

    class func decodeError(error: DecodingError) {
        //TODO сделать отправку ошибки на сервер
        switch error {
        case .dataCorrupted(let context):
            print(context.debugDescription)
        case .keyNotFound(_, let context):
            print(context.debugDescription)
        case .typeMismatch(_, let context):
            print(context.debugDescription)
        case .valueNotFound(_, let context):
            print(context.debugDescription)
        default:
            print(error.localizedDescription)
        }
    }
    
}
