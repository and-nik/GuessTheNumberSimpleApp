//
//  DataHandler.swift
//  GuessTheNumberSimpleApp
//
//  Created by And Nik on 14.01.23.
//

import Foundation
import UIKit

enum DataKeys{
    
    static let guessedNumbersScore = "guessedNumbersScore"
}

class DataHandler{
    
    static let shared = DataHandler()
    
    private let defaults = UserDefaults.standard
    
    func save(value: Int){
        
        self.defaults.set(value, forKey: DataKeys.guessedNumbersScore)
    }
    
    func load() -> Int{
        
        guard let score = self.defaults.object(forKey: DataKeys.guessedNumbersScore) as? Int else {return 0}
        return score
    }
}
