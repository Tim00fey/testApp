//
//  TestViewController.swift
//  testApp
//
//  Created by Тимофей Юдин on 12.03.2023.
//

import UIKit

final class TestViewController: UIViewController {
    
    @IBOutlet var answerButtons: [UIButton]!
    
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
