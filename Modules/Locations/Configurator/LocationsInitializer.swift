//
//  LocationsLocationsInitializer.swift
//  rm-viper
//
//  Created by Ilya Tarasov on 23/07/2020.
//  Copyright © 2020 Private. All rights reserved.
//

import UIKit

class LocationsModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var locationsViewController: LocationsViewController!

    private func configure(asRoot: Bool = false) -> UIViewController {
        let sb = UIStoryboard(name: "Locations", bundle: nil)
        if let nc = sb.instantiateViewController(withIdentifier: "LocationsViewController") as? UINavigationController {
            locationsViewController = nc.topViewController as? LocationsViewController
        } else {
            locationsViewController = sb.instantiateViewController(withIdentifier: "LocationsViewController") as? LocationsViewController
        }

        let configurator = LocationsModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: locationsViewController)

	if asRoot, let nc = locationsViewController.navigationController {
            return nc
        } else {
            return locationsViewController
        }
    }

    convenience init(window: UIWindow?) {
        self.init()

        let _vc = configure(asRoot: true)
        window?.rootViewController = _vc
        window?.makeKeyAndVisible()
    }

    convenience init(pushIn nc: UINavigationController, animated: Bool = true) {
        self.init()

        let _vc = configure()
        nc.pushViewController(_vc, animated: animated)
    }

    convenience init(presentIn vc: UIViewController, animated: Bool = true, completion: (() -> Void)?) {
        self.init()

        let _vc = configure()
        if let _nc = _vc.navigationController {
            vc.present(_nc, animated: animated, completion: completion)
        } else {
            vc.present(_vc, animated: animated, completion: completion)
        }
    }

    override func awakeFromNib() {
        let configurator = LocationsModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: locationsViewController)
    }

}
