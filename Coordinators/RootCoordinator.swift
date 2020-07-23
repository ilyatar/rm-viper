//
//  RootCoordinator.swift
//  rm-viper
//
//  Created by Илья Тарасов on 23.07.2020.
//  Copyright © 2020 Илья Тарасов. All rights reserved.
//

import UIKit

enum RoutePages {
    case main
    case characters(tabBar: TabBarViewController)
    case locations(tabBar: TabBarViewController)
    case episodes(tabBar: TabBarViewController)
    case detailCharacter(input: ModuleInput? = nil, output: ModuleOutput? = nil, deeplink: String? = nil)
}

class RootCoordinator {
    
    static let shared = RootCoordinator()
    
    private static var window: UIWindow?
    
    var input: ModuleInput?
    var output: ModuleOutput?
    var deeplink: String?

    class func setup(_ window: UIWindow?) {
        self.window = window
    }
    
    private init() {
        guard RootCoordinator.window != nil else {
            fatalError("Error - you must call setup before accessing RootCoordinator.shared")
        }
    }
    
    func show(_ page: RoutePages) {
        self.input = nil
        self.output = nil
        self.deeplink = nil
        
        switch page {
        case .main:
            TabBarRouter.createModule(window: RootCoordinator.window)
        case let .characters(tabBar):
            tabBar.changeTabPage(CharactersViewController.self)
        case let .episodes(tabBar):
            tabBar.changeTabPage(EpisodesViewController.self)
        case let .locations(tabBar):
            tabBar.changeTabPage(LocationsViewController.self)
        case let .detailCharacter(_input, _output, _deeplink):
            self.input = _input ?? self
            self.output = _output
            self.deeplink = _deeplink
            if let nc = getNavigationController() {
                DetailCharacterRouter.pushModule(nc: nc, animated: true, input: input, output: output)
            }
        }
    }
    
    private func getNavigationController() -> UINavigationController? {
        return RootCoordinator.window?.rootViewController!.topMostViewController().navigationController
    }
    
}

extension RootCoordinator: ModuleInput {
    
    func getInputData() -> Any? {
        return ["deeplink": deeplink]
    }

}
