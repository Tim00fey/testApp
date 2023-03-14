//
//  CoffeeResultViewController.swift
//  testApp
//
//  Created by Kirill Kniga on 14.03.2023.
//

import UIKit

class CoffeeResultViewController: UIViewController {

    @IBOutlet var resultLabel: UILabel!
    public var answerChosen: [CoffeeAnswer]!
    private var result = ""
    

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        getResult()
    
    }

    @IBAction func doneButtonPressed() {
        dismiss(animated: true)
    }
}

private extension CoffeeResultViewController {
    private func getResult() {
        for answer in answerChosen {
            if answer.type == .espresso {
                resultLabel.text = answer.title
            } else if answer.type == .cappucino {
                resultLabel.text = answer.title
            } else if answer.type == .americano {
                resultLabel.text = answer.title
            } else {
                resultLabel.text = answer.title
            }
        }
    }
    
}
