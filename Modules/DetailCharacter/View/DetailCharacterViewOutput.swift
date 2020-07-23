//
//  DetailCharacterViewOutput.swift
//  rm-viper
//
//  Created by Ilya Tarasov on 23/07/2020.
//  Copyright © 2020 Private. All rights reserved.
//

protocol DetailCharacterViewOutput {

    /**
        @author Ilya Tarasov
        Notify presenter that view is ready
    */

    var character: CharacterEntity? { get }

    func viewIsReady()
}
