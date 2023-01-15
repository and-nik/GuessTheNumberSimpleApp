//
//  ViewModel.swift
//  GuessTheNumberSimpleApp
//
//  Created by And Nik on 14.01.23.
//

import Foundation
import UIKit

class AppViewModel {
    
    var inputNumber = 0
    var generatedNumber: Int?
}

extension AppViewModel : AppViewModelDelegate{
    
    var isNumbersEquals: Bool {
        
        guard let genNumber = self.generatedNumber else {return false}
        
        return self.inputNumber == genNumber
    }
    
    func generateNewNumber(rangeMin: Int, rangeMax: Int) {
        
        self.generatedNumber = Int.random(in: rangeMin...rangeMax)
    }
    
    func getAnthwer() -> String {
        
        guard let gen = self.generatedNumber else {return ""}
        
        if self.isNumbersEquals{
            
            DataHandler.shared.save(value: score + 1)
            return "Congratulations! You guessed the number.\n The number was: \(String(describing: gen))"
        }
        else {
            return "Failure! Numbers are not equales.\n The number was: \(String(describing: gen))"
        }
        
        //isNumbersEquals ? return "Congratulations! You guessed the number."; : return "Failure! Numbers are not equales."
    }
    
    func getAnthwerColor() -> UIColor {
        
        if self.isNumbersEquals{
            return .systemGreen
        }
        else {
            return .systemRed
        }
    }
}
