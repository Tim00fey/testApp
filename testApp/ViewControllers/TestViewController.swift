//
//  TestViewController.swift
//  testApp
//
//  Created by Тимофей Юдин on 12.03.2023.
//

import UIKit
//MARK: - Outlets and Private 
final class TestViewController: UIViewController {
    
    @IBOutlet var titleOfQuestion: UILabel!
    
    @IBOutlet var answerButtons: [UIButton]!
    @IBOutlet var buttonsStack: UIStackView!

    @IBOutlet var multipleLabels: [UILabel]!
    @IBOutlet var multipleSwitches: [UISwitch]!
    @IBOutlet var multipleStack: UIStackView!
    
    @IBOutlet var slider: UISlider!
    @IBOutlet var sliderStack: UIStackView!
    
    @IBOutlet var textField: UITextField!
    
    private let countryQuestions = CountryQuestion.getQuestions()
    private var answerChosen: [Answer] = []
    private var currentAnswers: [Answer] {
        countryQuestions[questionIndex].answers
    }
    private var questionIndex = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupAnswerButtons(answerButtons)
    }
    
    @IBAction func answerButtonTapped(_ sender: UIButton) {
        answerButtons.forEach { button in
            button.backgroundColor = .systemGray5
        }
        
        sender.backgroundColor = .systemBlue
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
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
