//
//  ViewController.swift
//  GuessTheNumberSimpleApp
//
//  Created by And Nik on 13.01.23.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Values
    
    var appViewModel = AppViewModel()
    
    //MARK: - Dispayed UI and configuration
    
    private let guessNumberMinRangeTextField = UITextField()
    private func guessNumberMinRangeTextFieldConfig(){
        
        self.guessNumberMinRangeTextField.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(self.guessNumberMinRangeTextField)
        
        NSLayoutConstraint.activate([
            self.guessNumberMinRangeTextField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            self.guessNumberMinRangeTextField.trailingAnchor.constraint(equalTo: self.view.centerXAnchor, constant: -10),
            self.guessNumberMinRangeTextField.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 50),
            self.guessNumberMinRangeTextField.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        self.guessNumberMinRangeTextField.placeholder = "Enter Range (min)"
        self.guessNumberMinRangeTextField.textAlignment = .center
    }
    
    private let guessNumberMaxRangeTextField = UITextField()
    private func guessNumberMaxRangeTextFieldConfig(){
        
        self.guessNumberMaxRangeTextField.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(self.guessNumberMaxRangeTextField)
        
        NSLayoutConstraint.activate([
            self.guessNumberMaxRangeTextField.leadingAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 10),
            self.guessNumberMaxRangeTextField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            self.guessNumberMaxRangeTextField.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 50),
            self.guessNumberMaxRangeTextField.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        self.guessNumberMaxRangeTextField.placeholder = "Enter Range (max)"
        self.guessNumberMaxRangeTextField.textAlignment = .center
    }
    
    private let generateNumberButton = UIButton(type: .system)
    private func generateNumberButtonConfig(){
        
        self.generateNumberButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(self.generateNumberButton)
        
        NSLayoutConstraint.activate([
            self.generateNumberButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            self.generateNumberButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            self.generateNumberButton.topAnchor.constraint(equalTo: self.guessNumberMaxRangeTextField.bottomAnchor, constant: 20),
            self.generateNumberButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        self.generateNumberButton.backgroundColor = .orange
        
        self.generateNumberButton.layer.shadowRadius = 10
        self.generateNumberButton.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.generateNumberButton.layer.shadowOpacity = 0.5
        
        self.generateNumberButton.setTitle("Generate new number", for: .normal)
        self.generateNumberButton.setTitleColor(.white, for: .normal)
        
        self.generateNumberButton.addTarget(self, action: #selector(handleGenerateNumber), for: .touchUpInside)
    }
    
    @objc private func handleGenerateNumber(){
        
        guard let minNumber = self.guessNumberMinRangeTextField.text else {
            let alert = Functions.createAllertWhith(titel: "Error!", description: "Enter some min number in range.", buttonTitel: "Ok")
            self.present(alert, animated: true)
            return
        }
        guard let maxNumber = self.guessNumberMaxRangeTextField.text else {
            let alert = Functions.createAllertWhith(titel: "Error!", description: "Enter some max number in range.", buttonTitel: "Ok")
            self.present(alert, animated: true)
            return
        }
        
        guard let min = Int(minNumber) else {
            let alert = Functions.createAllertWhith(titel: "Error!", description: "Enter only number in min range.", buttonTitel: "Ok")
            self.present(alert, animated: true)
            return
        }
        guard let max = Int(maxNumber) else {
            let alert = Functions.createAllertWhith(titel: "Error!", description: "Enter only number in max range.", buttonTitel: "Ok")
            self.present(alert, animated: true)
            return
        }
        
        if min >= max {
            let alert = Functions.createAllertWhith(titel: "Error!", description: "Min value can not be more then max ore equals max.", buttonTitel: "Ok")
            self.present(alert, animated: true)
            return
        }
        
        appViewModel.generateNewNumber(rangeMin: min, rangeMax: max)
        
        let alert = Functions.createAllertWhith(titel: "Success!", description: "New number is generated.", buttonTitel: "Ok")
        self.present(alert, animated: true)
    }
    
    private let usersNumberTextField = UITextField()
    private func usersNumberTextFieldCongif(){
        
        self.usersNumberTextField.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(self.usersNumberTextField)
        
        NSLayoutConstraint.activate([
            self.usersNumberTextField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            self.usersNumberTextField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            self.usersNumberTextField.topAnchor.constraint(equalTo: self.generateNumberButton.bottomAnchor, constant: 60),
            self.usersNumberTextField.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        self.usersNumberTextField.placeholder = "Enter your number"
        self.usersNumberTextField.textAlignment = .center
    }

    private let guessButton = UIButton(type: .system)
    private func guessButtonConfig(){
        
        self.guessButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(self.guessButton)
        
        NSLayoutConstraint.activate([
            self.guessButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            self.guessButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            self.guessButton.topAnchor.constraint(equalTo: self.usersNumberTextField.bottomAnchor, constant: 20),
            self.guessButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        self.guessButton.backgroundColor = .orange
        
        self.guessButton.layer.shadowRadius = 10
        self.guessButton.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.guessButton.layer.shadowOpacity = 0.5
        
        self.guessButton.setTitle("Guesss", for: .normal)
        self.guessButton.setTitleColor(.white, for: .normal)
        
        self.guessButton.addTarget(self, action: #selector(handleGuess), for: .touchUpInside)
    }
    
    @objc private func handleGuess(){
        
        guard let title = self.guessButton.titleLabel else {return}
        if title.text == "Restart"{
            
            self.handleGenerateNumber()
            
            self.guessButton.backgroundColor = .orange
            self.guessButton.setTitle("Guesss", for: .normal)
            self.guessButton.setTitleColor(.white, for: .normal)
        }
        
        guard let inputNumber = self.usersNumberTextField.text else {
            let alert = Functions.createAllertWhith(titel: "Error!", description: "Enter some number.", buttonTitel: "Ok")
            self.present(alert, animated: true)
            return
        }
        
        guard let input = Int(inputNumber) else {
            let alert = Functions.createAllertWhith(titel: "Error!", description: "Enter only number.", buttonTitel: "Ok")
            self.present(alert, animated: true)
            return
        }
        
        if self.appViewModel.generatedNumber == nil{
            let alert = Functions.createAllertWhith(titel: "Error!", description: "You must generate an number firstly.", buttonTitel: "Ok")
            self.present(alert, animated: true)
            return
        }
        
        self.appViewModel.inputNumber = input
        
        self.anthwerLabel.text = appViewModel.getAnthwer()
        self.anthwerLabel.textColor = appViewModel.getAnthwerColor()
        self.rightGuessedNumbersScoreLabel.text = "Guessed numbers: \(score)"
        
        self.restart()
    }
    
    private let anthwerLabel = UILabel()
    private func anthwerLabelConfig(){
        
        self.anthwerLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(self.anthwerLabel)
        
        NSLayoutConstraint.activate([
            self.anthwerLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            self.anthwerLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            self.anthwerLabel.topAnchor.constraint(equalTo: self.guessButton.bottomAnchor, constant: 20),
            self.anthwerLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        self.anthwerLabel.textAlignment = .center
        self.anthwerLabel.numberOfLines = 2
    }
    
    private let rightGuessedNumbersScoreLabel = UILabel()
    private func rightGuessedNumbersScoreLabelConfig(){
        
        self.rightGuessedNumbersScoreLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(self.rightGuessedNumbersScoreLabel)
        
        NSLayoutConstraint.activate([
            self.rightGuessedNumbersScoreLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            self.rightGuessedNumbersScoreLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            self.rightGuessedNumbersScoreLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20),
            self.rightGuessedNumbersScoreLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        self.rightGuessedNumbersScoreLabel.textAlignment = .left
        self.rightGuessedNumbersScoreLabel.text = "Guessed numbers: \(score)"
    }
    
    //MARK: -
    
    private func controllerConfig(){
        self.view.backgroundColor = .systemBackground
    }
    
    private func restart(){
        
        UIView.animate(withDuration: 0.5, delay: 0) {
            self.guessButton.setTitle("Restart", for: .normal)
            self.guessButton.setTitleColor(.tintColor, for: .normal)
            self.guessButton.backgroundColor = .systemGray5
        }
        
        self.usersNumberTextField.text = nil
        
    }
    
    //MARK: - Overrides functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.controllerConfig()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        self.guessButton.layer.cornerRadius = self.guessButton.bounds.height/2

        self.generateNumberButton.layer.cornerRadius = self.generateNumberButton.bounds.height/2

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.guessNumberMinRangeTextFieldConfig()
        self.guessNumberMaxRangeTextFieldConfig()
        self.generateNumberButtonConfig()
        self.usersNumberTextFieldCongif()
        self.guessButtonConfig()
        self.anthwerLabelConfig()
        self.rightGuessedNumbersScoreLabelConfig()
    }

}

