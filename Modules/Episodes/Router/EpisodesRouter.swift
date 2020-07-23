//
//  EpisodesEpisodesRouter.swift
//  rm-viper
//
//  Created by Ilya Tarasov on 23/07/2020.
//  Copyright © 2020 Private. All rights reserved.
//

import UIKit

class EpisodesRouter: EpisodesRouterInput {

    static var window: UIWindow?
    static var input: ModuleInput?
    static var output: ModuleOutput?

    class func createModule(window: UIWindow?) {
        EpisodesRouter.window = window
        _ = EpisodesModuleInitializer(window: window)
    }

    class func pushModule(nc: UINavigationController, animated: Bool, input: ModuleInput?, output: ModuleOutput?) {
        self.input = input
        self.output = output
        _ = EpisodesModuleInitializer(pushIn: nc, animated: animated)
    }

    class func presentModule(vc: UIViewController, input: ModuleInput?, output: ModuleOutput?, completion: (() -> Void)?) {
        self.input = input
        self.output = output
        _ = EpisodesModuleInitializer(presentIn: vc, completion: completion)
    }

}
