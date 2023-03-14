//
//  CoffeeTestViewController.swift
//  testApp
//
//  Created by Kirill Kniga on 14.03.2023.
//

import UIKit

class CoffeeTestViewController: UIViewController {

    @IBOutlet var questionLabel: UILabel!
    
    @IBOutlet var multipleStackView: UIStackView!
    @IBOutlet var multipleLabels: [UILabel]!
    @IBOutlet var multipleSwitches: [UISwitch]!
    
    @IBOutlet var rangedStackView: UIStackView!
    @IBOutlet var rangedLabels: [UILabel]!
    @IBOutlet var rangedSlider: UISlider! {
        didSet {
            let answerCount = Float(currentAnswers.count - 1)
            rangedSlider.maximumValue = answerCount
            rangedSlider.value = answerCount / 2
        }
    }
    
    private let questions = CoffeeQuestion.getQuestions()
    private var answerChosen: [CoffeeAnswer] = []
    private var currentAnswers: [CoffeeAnswer] {
        questions[questionIndex].answers
    }
    
    
    private var questionIndex = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        multipleSwitches.last?.isEnabled = false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let resultVC = segue.destination as? CoffeeResultViewController else { return }
        resultVC.answerChosen = answerChosen
    }
    
    @IBAction func multipleAnswerButtonPressed() {
        for (multipleSwitch, answer) in zip(multipleSwitches, currentAnswers) {
            if multipleSwitch .isOn {
                answerChosen.append(answer)
            }
        }
        
        nextQuestion()
    }
    
    @IBAction func rangedAnswerButtonPressed() {
        let index = lrintf(rangedSlider.value)
        answerChosen.append(currentAnswers[index])
        nextQuestion()
    }
    
}


private extension CoffeeTestViewController {
    func updateUI() {
        for stackView in [multipleStackView, rangedStackView] {
            stackView?.isHidden = true
        }
        
        // Get current question
        let currentQuestion = questions[questionIndex]
        
        // Set current question for questionLabel
        questionLabel.text = currentQuestion.title
        
        // Calculate progress
        //      let totalProgress = Float(questionIndex) / Float(questions.count)
        
        // Set progress for questionProgressView
        //     questionProgressView.setProgress(totalProgress, animated: true)
        
        // Set navigation title
        title =  "Вопрос №\(questionIndex + 1) из \(questions.count)"
        
        // Show stack corresponding to question type
        showCurrentAnswers(for: currentQuestion.responseType)
        
    }
    
    
    func showCurrentAnswers(for type: CoffeeResponseType) {
        switch type {
        case .multiple: showMultipleStackView(with: currentAnswers)
        case .ranged: showRangedStackView(with: currentAnswers)
        }
    }
    
    func showMultipleStackView(with answers: [CoffeeAnswer]) {
        multipleStackView.isHidden.toggle()
        
        for (label, answer) in zip(multipleLabels, answers) {
            label.text = answer.title
        }
    }
    
    func showRangedStackView(with answers: [CoffeeAnswer]) {
        rangedStackView.isHidden.toggle()
        
        rangedLabels.first?.text = "Мягче"
        rangedLabels.last?.text = "Крепче"
    }
    
    func nextQuestion() {
        questionIndex += 1
        
        if questionIndex < questions.count {
            updateUI()
            return
        }
        
        performSegue(withIdentifier: "showResult", sender: nil)
    }
    
}
