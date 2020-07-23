//
//  UITabBarController+extensions.swift
//  rm-viper
//
//  Created by Илья Тарасов on 23.07.2020.
//  Copyright © 2020 Илья Тарасов. All rights reserved.
//

import UIKit

extension UITabBarController {
    
    override func topMostViewController() -> UIViewController {
        return self.selectedViewController!.topMostViewController()
    }
    
}
