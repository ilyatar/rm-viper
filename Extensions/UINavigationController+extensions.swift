//
//  UINavigationController+extensions.swift
//  rm-viper
//
//  Created by Ilya Tarasov on 23/07/2020.
//  Copyright © 2020 Private. All rights reserved.
//

import UIKit

extension UINavigationController {
        
    override func topMostViewController() -> UIViewController {
        return self.visibleViewController!.topMostViewController()
    }

    func transparentNavigationBar() {
        self.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationBar.shadowImage = UIImage()
        self.navigationBar.isTranslucent = true
    }
    
    func isUserInteractionNavigationBar(enabled: Bool) {
        self.view.subviews.forEach{
            if let v = $0 as? UINavigationBar {
                $0.isUserInteractionEnabled = enabled
                $0.isHidden = !enabled
                for _v in v.subviews {
                    _v.isHidden = !enabled
                    _v.isUserInteractionEnabled = enabled
                }
            }
        }
    }

    func popViewController(before vcClass: AnyClass, animated: Bool) {
        if let controller = self.childControllerBefore(vcClass) {
            self.popToViewController(controller, animated: animated)
        } else {
            self.popViewController(animated: animated)
        }
    }
    
    func childControllerBefore(_ vcClass: AnyClass) -> UIViewController? {
        if let ix = self.firstIndex(vcClass) {
            if ix > 0 {
                return self.viewControllers[ix - 1]
            } else {
                return self.viewControllers[0]
            }
        }
        return nil
    }
        
    func firstIndex(_ vcClass: AnyClass) -> Int? {
        for (ix, vc) in self.viewControllers.enumerated() {
            if vc.isKind(of: vcClass) {
                return ix
            }
        }
        return nil
    }

    func firstController(_ vcClass: AnyClass) -> UIViewController? {
        for (_, vc) in self.viewControllers.enumerated() {
            if vc.isKind(of: vcClass) {
                return vc
            }
        }
        return nil
    }

}
