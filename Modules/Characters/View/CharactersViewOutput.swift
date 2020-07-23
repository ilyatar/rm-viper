//
//  CharactersViewOutput.swift
//  rm-viper
//
//  Created by Ilya Tarasov on 23/07/2020.
//  Copyright © 2020 Private. All rights reserved.
//

protocol CharactersViewOutput {

    /**
        @author Ilya Tarasov
        Notify presenter that view is ready
    */

    func viewIsReady()
    func getNextPageCharacters() 
    func showDetail(_ character: CharacterEntity) 

}
