//
//  LocationsParser.swift
//  rm-viper
//
//  Created by Илья Тарасов on 23.07.2020.
//  Copyright © 2020 Илья Тарасов. All rights reserved.
//

import Foundation

struct LocationsResponse: Codable {
    let info: InfoEntity?
    let results: [LocationEntity]?
}

class LocationsParser {
    
    class func parseLocations(data: Data?) -> [LocationEntity]? {
        guard let _data = data else { return nil }

        let decoder = JSONDecoder()
        do {
            let obj = try decoder.decode(LocationsResponse.self, from: _data)
            return obj.results
        } catch {
            if let _error = error as? DecodingError {
                ErrorParser.decodeError(error: _error)
            }
            return nil
        }
    }

}
