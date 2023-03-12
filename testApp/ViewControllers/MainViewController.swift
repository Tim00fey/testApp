//
//  ViewController.swift
//  testApp
//
//  Created by Тимофей Юдин on 10.03.2023.
//

import UIKit

final class MainViewController: UIViewController {
    
    @IBOutlet var titleOfTestImages: [UIImageView]!
    @IBOutlet var testStacks: [UIStackView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupStacks(testStacks)
    }

    override func viewWillLayoutSubviews() {
        setupImages(titleOfTestImages)
    }
    
}

// MARK: Private Methods
private extension MainViewController {
    func setupStacks(_ stacks: [UIStackView]) {
        stacks.forEach { stack in
            stack.layer.cornerRadius = 10
        }
    }
    
    func setupImages(_ images: [UIImageView]) {
        images.forEach { image in
            image.layer.cornerRadius = image.frame.height / 2
        }
        
    }
    
}


