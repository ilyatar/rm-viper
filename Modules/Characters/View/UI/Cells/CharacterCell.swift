//
//  CharacterCell.swift
//  rm-viper
//
//  Created by Илья Тарасов on 23.07.2020.
//  Copyright © 2020 Илья Тарасов. All rights reserved.
//

import UIKit

class CharacterCell: UITableViewCell {

    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var createdLabel: UILabel!
    
    static let kReuseIdentifier = "CharacterCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func updateCharacter(_ character: CharacterEntity, tag: Int) {
        self.nameLabel.text = character.name
        self.createdLabel.text = character.created
        
        self.icon.image = nil //or keep any placeholder here
        self.tag = tag
                
        character.getImage {[weak self] (image) in
            DispatchQueue.main.async() {
                if self?.tag == tag {
                    self?.icon.image = image
                }
            }
        }
        
    }
    
}
