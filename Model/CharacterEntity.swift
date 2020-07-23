//
//  CharacterEntity.swift
//  rm-viper
//
//  Created by Илья Тарасов on 23.07.2020.
//  Copyright © 2020 Илья Тарасов. All rights reserved.
//

import UIKit

public class CharacterEntity: Codable {
        
    var id: Int?
    var name: String?
    var status: String?
    var species: String?
    var type: String?
    var gender: String?
    var origin: LocationEntity?
    var location: LocationEntity?
    var image: String?
    var episode: [String]?
    var url: String?
    var created: String?
    
    private var imageData: Data?
    func getImage(completed: @escaping (UIImage?) -> Void) -> Void {
        if let data = imageData, let _image = UIImage(data: data) {
            completed(_image)
        } else {
            if let urlPath = image, let url = URL(string: urlPath) {
                let task = URLSession.shared.dataTask(with: url) {[weak self] (data, response, error) in
                    guard let data = data, error == nil else {
                        completed(nil)
                        return
                    }
                    self?.imageData = data
                    completed(UIImage(data: data))
                }
                task.resume()
            }
        }
    }
}
