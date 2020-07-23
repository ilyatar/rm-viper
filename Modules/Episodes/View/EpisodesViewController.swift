//
//  EpisodesEpisodesViewController.swift
//  rm-viper
//
//  Created by Ilya Tarasov on 23/07/2020.
//  Copyright © 2020 Private. All rights reserved.
//

import UIKit

class EpisodesViewController: UIViewController {

    var output: EpisodesViewOutput!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }

    func configureUI() {
        navigationController?.transparentNavigationBar()
        navigationController?.navigationBar.prefersLargeTitles = true
    }

}

extension EpisodesViewController: EpisodesViewInput {

    // MARK: EpisodesViewInput
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
