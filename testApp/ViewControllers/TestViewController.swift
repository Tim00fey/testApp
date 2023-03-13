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
    
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var questionProgressView: UIProgressView!
    
    @IBOutlet var answerButtons: [UIButton]!
    @IBOutlet var buttonsStack: UIStackView!

    @IBOutlet var countryTextField: UITextField!
    @IBOutlet var writeCountryStackView: UIStackView!
    
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
    
    @IBAction func writeButtonTapped() {
        if countryTextField.text == (Answer.title, for .write) {
            answerChosen.append(currentAnswers[Index])
        }
            else {
            showAlert(withTitle: "Ошибка!", andMessage: "Попробуйте еще раз.")
        }
        nextQuestion()
    }
    
    @IBAction func singleButtonTapped(_ sender: UIButton) {
        guard let buttonIndex = singleCountryButtons.firstIndex(of: sender)
        else { return}
        
        let currentAnswer = currentAnswers[buttonIndex]
        answerChosen.append(currentAnswer)
        
        nextQuestion()
    }
}

@IBAction func multipleButtonPressed() {
    for (multipleCountrySwitches, answer) in zip(multipleCountrySwitches, currentAnswers) {
        if multipleCountrySwitches.isOn{
            answerChosen.append(answer)
        }
    }
    nextQuestion()
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
    
    func updateUI() {
        for stackView in [] {
            stackView?.isHidden = true
        }
    let currentQuestion = countryQuestions[questionIndex]
        
        questionLabel.text = currentQuestion.titleOfQuestion
        
        let totalProgress = Float(questionIndex) / Float(countryQuestions.count)
        questionProgressView.setProgress(totalProgress, animated: true)
        
        title = "Вопрос № \(questionIndex + 1) из \(countryQuestions.count)"
        
        showCurrentAnswers(for: currentQuestion.responseType)
    }
    
    func showCurrentAnswers(for type: ResponseType) {
        switch type {
        case .write:
        case .multiple:
        case .single:
        }
    }
}
