//
//  ResultViewController.swift
//  testApp
//
//  Created by Тимофей Юдин on 12.03.2023.
//

import UIKit

final class ResultViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.hidesBackButton = true
    }
    
    @IBAction func goHomeButtonTapped() {
        dismiss(animated: true)
    }
    
}
