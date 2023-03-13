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
    
    @IBOutlet var questionProgressView: UIProgressView!
    
    @IBOutlet var answerButtons: [UIButton]!
    @IBOutlet var buttonsStack: UIStackView!

    @IBOutlet var writeStackView: UIStackView!
    
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
        updateUI()
        setupAnswerButtons(answerButtons)
    }
    
    @IBAction func answerButtonTapped(_ sender: UIButton) {
        answerButtons.forEach { button in
            button.backgroundColor = .systemGray5
        }
        
        sender.backgroundColor = .systemBlue
    }
    
    @IBAction func writeButtonTapped() {
//        if textField.text == ([answers].title, for .write) {
//            answerChosen.append()
//        }
        nextQuestion()
    }
    
    @IBAction func singleButtonTapped(_ sender: UIButton) {
        guard let buttonIndex = answerButtons.firstIndex(of: sender)
        else { return}
        
        let currentAnswer = currentAnswers[buttonIndex]
        answerChosen.append(currentAnswer)
        
        nextQuestion()
    }


@IBAction func multipleButtonPressed() {
    for (multipleSwitch, answer) in zip(multipleSwitches, currentAnswers) {
        if multipleSwitch.isOn{
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
        for stackView in [textField, buttonsStack, multipleStack, sliderStack] {
            stackView?.isHidden = true
        }
        let currentQuestion = countryQuestions[questionIndex]
        
        titleOfQuestion.text = currentQuestion.titleOfQuestion
        
        let totalProgress = Float(questionIndex) / Float(countryQuestions.count)
        questionProgressView.setProgress(totalProgress, animated: true)
        
        title = "Вопрос № \(questionIndex + 1) из \(countryQuestions.count)"
        
        showCurrentAnswers(for: currentQuestion.responseType)
    }
    
    func showCurrentAnswers(for type: ResponseType) {
        switch type {
        case .write: showTextField(with: currentAnswers)
        case .single: showButtonStack(with: currentAnswers)
        case .multiple: showMultipleStack(with: currentAnswers)
        }
    }
    
    func showTextField(with answers: [Answer]) {
        textField.isHidden.toggle()
    }
    
    func showButtonStack(with answers: [Answer]) {
        buttonsStack.isHidden.toggle()
        for (button, answer) in zip(answerButtons, answers){
            button.setTitle(answer.title, for: .normal)
        }
        
    }
    func showMultipleStack(with answers: [Answer]) {
        multipleStack.isHidden.toggle()
        for (label, answer) in zip(multipleLabels, answers) {
            label.text = answer.title
        }
    }
    
    func nextQuestion() {
        questionIndex += 1
        if questionIndex < countryQuestions.count {
            updateUI()
            return
        }
        performSegue(withIdentifier: "goToResult", sender: nil)
    }
}
