//
//  DetailCharacterDetailCharacterViewController.swift
//  rm-viper
//
//  Created by Ilya Tarasov on 23/07/2020.
//  Copyright © 2020 Private. All rights reserved.
//

import UIKit

class DetailCharacterViewController: UIViewController {

    var output: DetailCharacterViewOutput!

    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var speciesLabel: UILabel!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }

    func configureUI() {
        output.character?.getImage(completed: {[weak self] (image) in
            self?.icon.image = image
        })
        nameLabel.text = output.character?.name
        speciesLabel.text = output.character?.species
    }

}

extension DetailCharacterViewController: DetailCharacterViewInput {

    // MARK: DetailCharacterViewInput
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
