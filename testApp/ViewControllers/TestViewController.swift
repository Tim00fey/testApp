//
//  TestViewController.swift
//  testApp
//
//  Created by Тимофей Юдин on 12.03.2023.
//

import UIKit
//MARK: - Outlets and Private 
final class TestViewController: UIViewController {
    
    @IBOutlet var answerButtons: [UIButton]!
    
    @IBOutlet var CountryTextField: UITextField!
    @IBOutlet var writeCountryStackView: UIStackView!
    
    @IBOutlet var singleCountryView: UIStackView!
    @IBOutlet var singleCountryButtons: [UIButton]!
    
    @IBOutlet var multipleCountryStackView: UIStackView!
    @IBOutlet var multipleCountryLabels: [UILabel]!
    @IBOutlet var multipleCountrySwitches: [UISwitch]!
    
    private let countryQuestions = CountryQuestion.getQuestions()
    private var answerChosen: [Answer] = []
    private var currentAnswers: [Answer] {
        countryQuestions[questionIndex].answers
    }
    private var questionIndex = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.hidesBackButton = true
        setupAnswerButtons(answerButtons)
    }
    
    @IBAction func answerButtonTapped(_ sender: UIButton) {
        answerButtons.forEach { button in
            button.backgroundColor = .systemGray5
        }
        
        sender.backgroundColor = .systemBlue
    }
    
}

// MARK: Private Methods
private extension TestViewController {
    func setupAnswerButtons(_ buttons: [UIButton]) {
        buttons.forEach { button in
            button.layer.cornerRadius = 10
        }
    }
}
