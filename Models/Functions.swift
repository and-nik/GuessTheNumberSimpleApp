//
//  Functions.swift
//  GuessTheNumberSimpleApp
//
//  Created by And Nik on 14.01.23.
//

import Foundation
import UIKit

class Functions{
    
    static func createAllertWhith(titel: String, description: String, buttonTitel: String) -> UIAlertController
    {
        let alert = UIAlertController(title: titel, message: description, preferredStyle: .alert)
        let alertButton = UIAlertAction(title: buttonTitel, style: .default)
        
        alert.addAction(alertButton)
        return alert
    }
}
