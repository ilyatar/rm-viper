//
//  BaseProvider.swift
//  rm-viper
//
//  Created by Ilya Tarasov on 23/07/2020.
//  Copyright © 2020 Private. All rights reserved.
//

import Moya

struct BaseProvider {
    
    static func getProvider<T: TargetType>(withToken: Bool = false) -> MoyaProvider<T> {
        var plugins = [PluginType]()

        #if DEBUG
        var conf = NetworkLoggerPlugin.Configuration()
        conf.logOptions = NetworkLoggerPlugin.Configuration.LogOptions.verbose //логирование ответа
        plugins.append(NetworkLoggerPlugin(configuration: conf))
        #endif
        
        if withToken {
            plugins.append(AuthPlugin(token: "token"))
        } else {
            plugins.append(AuthPlugin(token: nil))
        }
        
        return MoyaProvider<T>(plugins: plugins)
    }
    
}
