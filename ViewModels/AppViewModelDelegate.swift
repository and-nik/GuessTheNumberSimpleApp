//
//  AppViewModelDelegate.swift
//  GuessTheNumberSimpleApp
//
//  Created by And Nik on 14.01.23.
//
import UIKit.UIColor

protocol AppViewModelDelegate {
    
    //var generatedNumber:Int {get set}
    //var inputNumber:Int {get set}
    
    var isNumbersEquals:Bool {get}
    
    func generateNewNumber(rangeMin: Int, rangeMax: Int)
    
    func getAnthwer() -> String
    func getAnthwerColor() -> UIColor
}
