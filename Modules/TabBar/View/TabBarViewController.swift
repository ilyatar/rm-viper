//
//  TabBarTabBarViewController.swift
//  rm-viper
//
//  Created by Ilya Tarasov on 23/07/2020.
//  Copyright © 2020 Private. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    var output: TabBarViewOutput!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }

    func configureUI() {

    }

    private func getController(_ obj: AnyObject) -> UIViewController? {
        if let nc = obj as? UINavigationController {
            return nc.viewControllers.first ?? nc.topViewController
        } else {
            return obj as? UIViewController
        }
    }

    func changeTabPage(_ tabPageClass: AnyClass) {
        if let ix = self.viewControllers?.firstIndex(where: {
            guard let vc = getController($0) else { return false }
            return vc.isKind(of: tabPageClass)
        }) {
            self.selectedIndex = ix
        }
    }

}

extension TabBarViewController: TabBarViewInput {

    // MARK: TabBarViewInput
    func setupInitialState() {
        configureUI()
    }

    func beginProgress(completion: (() -> Void)?) {
        completion?()
    }

    func endProgress(completion: (() -> Void)?) {
        completion?()
    }

}
