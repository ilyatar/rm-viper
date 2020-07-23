//
//  EpisodesEpisodesInitializer.swift
//  rm-viper
//
//  Created by Ilya Tarasov on 23/07/2020.
//  Copyright © 2020 Private. All rights reserved.
//

import UIKit

class EpisodesModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var episodesViewController: EpisodesViewController!

    private func configure(asRoot: Bool = false) -> UIViewController {
        let sb = UIStoryboard(name: "Episodes", bundle: nil)
        if let nc = sb.instantiateViewController(withIdentifier: "EpisodesViewController") as? UINavigationController {
            episodesViewController = nc.topViewController as? EpisodesViewController
        } else {
            episodesViewController = sb.instantiateViewController(withIdentifier: "EpisodesViewController") as? EpisodesViewController
        }

        let configurator = EpisodesModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: episodesViewController)

	if asRoot, let nc = episodesViewController.navigationController {
            return nc
        } else {
            return episodesViewController
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
        let configurator = EpisodesModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: episodesViewController)
    }

}
