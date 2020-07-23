//
//  Constants.swift
//  rm-viper
//
//  Created by Ilya Tarasov on 23/07/2020.
//  Copyright © 2020 Private. All rights reserved.
//

import UIKit

class Constant {
    
    #if DEBUG
    public static let isTestServers: Bool = true
    #else
    public static let isTestServers: Bool = false
    #endif
    
    public static var currentBaseUrl = isTestServers ? Constant.testBaseUrl : Constant.productionBaseUrl
    public static let productionBaseUrl = "https://rickandmortyapi.com/api"
    public static let testBaseUrl = "https://rickandmortyapi.com/api"
    
    public static let appStoreLink = "itms-apps://itunes.apple.com/app/id##########"
        
    public static var baseUrl: URL {
        get {
            return URL(string: Constant.baseUrlString)!
        }
    }
    public static var baseUrlString: String {
        get {
            return Constant.currentBaseUrl
        }
    }

}
