//
//  ViewController.swift
//  imc-viewcode
//
//  Created by Michelli Cristina de Paulo Lima on 05/09/22.
//

import UIKit

class ViewController: UIViewController {

    var imcScreen:ImcScreen?
    
    override func loadView() {
        self.imcScreen = ImcScreen()
        self.view = self.imcScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}

