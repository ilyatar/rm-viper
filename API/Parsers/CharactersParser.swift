//
//  CharactersParser.swift
//  rm-viper
//
//  Created by Ilya Tarasov on 23/07/2020.
//  Copyright © 2020 Private. All rights reserved.
//

import Foundation

struct CharactersResponse: Codable {
    let info: InfoEntity?
    let results: [CharacterEntity]?
}

class CharactersParser {
    
    class func parseCharacters(data: Data?) -> [CharacterEntity]? {
        guard let _data = data else { return nil }

        let decoder = JSONDecoder()
        do {
            let obj = try decoder.decode(CharactersResponse.self, from: _data)
            return obj.results
        } catch {
            if let _error = error as? DecodingError {
                ErrorParser.decodeError(error: _error)
            }
            return nil
        }
    }

}
