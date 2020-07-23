//
//  CharactersCharactersRouter.swift
//  rm-viper
//
//  Created by Ilya Tarasov on 23/07/2020.
//  Copyright © 2020 Private. All rights reserved.
//

import UIKit

class CharactersRouter: CharactersRouterInput {

    static var window: UIWindow?
    static var input: ModuleInput?
    static var output: ModuleOutput?

    class func createModule(window: UIWindow?) {
        CharactersRouter.window = window
        _ = CharactersModuleInitializer(window: window)
    }

    class func pushModule(nc: UINavigationController, animated: Bool, input: ModuleInput?, output: ModuleOutput?) {
        self.input = input
        self.output = output
        _ = CharactersModuleInitializer(pushIn: nc, animated: animated)
    }

    class func presentModule(vc: UIViewController, input: ModuleInput?, output: ModuleOutput?, completion: (() -> Void)?) {
        self.input = input
        self.output = output
        _ = CharactersModuleInitializer(presentIn: vc, completion: completion)
    }

}
