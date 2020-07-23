//
//  DetailCharacterDetailCharacterInitializer.swift
//  rm-viper
//
//  Created by Ilya Tarasov on 23/07/2020.
//  Copyright © 2020 Private. All rights reserved.
//

import UIKit

class DetailCharacterModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var detailcharacterViewController: DetailCharacterViewController!

    private func configure(asRoot: Bool = false) -> UIViewController {
        let sb = UIStoryboard(name: "DetailCharacter", bundle: nil)
        if let nc = sb.instantiateViewController(withIdentifier: "DetailCharacterViewController") as? UINavigationController {
            detailcharacterViewController = nc.topViewController as? DetailCharacterViewController
        } else {
            detailcharacterViewController = sb.instantiateViewController(withIdentifier: "DetailCharacterViewController") as? DetailCharacterViewController
        }

        let configurator = DetailCharacterModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: detailcharacterViewController)

	if asRoot, let nc = detailcharacterViewController.navigationController {
            return nc
        } else {
            return detailcharacterViewController
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
        let configurator = DetailCharacterModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: detailcharacterViewController)
    }

}
