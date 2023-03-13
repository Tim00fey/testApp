//
//  AboutDevelopersViewController.swift
//  testApp
//
//  Created by Тимофей Юдин on 13.03.2023.
//

import UIKit

class AboutDevelopersViewController: UIViewController {
    
    @IBOutlet var viewsWithNames: [UIView]!
    @IBOutlet var imagesWithPersons: [UIImageView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewsWithNames.forEach { view in
            view.layer.cornerRadius = 10
        }
    }
    
    override func viewWillLayoutSubviews() {
        imagesWithPersons.forEach { image in
            image.layer.cornerRadius = image.frame.height / 2
        }
    }

}
