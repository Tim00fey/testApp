//
//  ResultViewController.swift
//  testApp
//
//  Created by Тимофей Юдин on 12.03.2023.
//

import UIKit

final class ResultViewController: UIViewController {
    
    @IBOutlet var titleOfResultLabel: UILabel!
    @IBOutlet var descriptionOfTestLabel: UILabel!
    
    var answers: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
    }
    
    @IBAction func goHomeButtonTapped() {
        dismiss(animated: true)
    }
}
    extension ResultViewController {
        private func updateResulr() {
            var frequencyOfCorrect: [Correct: Int] = [:]
            let corrects = answers.map { $0.correct }
            
            for correct in corrects {
                if let correctTypeCount = frequencyOfCorrect[correct] {
                    frequencyOfCorrect.updateValue(correctTypeCount + 1, forKey: correct)
                } else {
                    frequencyOfCorrect[correct] = 1
                }
            }
            let sortedFrequencyOfCorrect = frequencyOfCorrect.sorted { $0.value > $1.value }
            guard let mostFrequencyOfCorrect = sortedFrequencyOfCorrect.first?.key else { return }
            
            updateUI(with: mostFrequencyOfCorrect)
        }
        private func updateUI(with correct: Correct) {
            if Correct.value > 2 {
                titleOfResultLabel.text = "Поздравляю!"
                descriptionOfTestLabel.text = "Вы справились без единой ошибки!"
            } else if Correct.value > 1 {
                titleOfResultLabel.text = "Поздравляю!"
                descriptionOfTestLabel.text = "Вы совершили 1 ошибку!"
            } else if Correct.value <= 1 {
                titleOfResultLabel.text = "Не расстраивайтесь!"
                descriptionOfTestLabel.text = "Попробуйте еще раз!"
            }
        }
        
    }
    
