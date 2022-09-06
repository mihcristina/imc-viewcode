//
//  ImcScreen.swift
//  imc-viewcode
//
//  Created by Michelli Cristina de Paulo Lima on 05/09/22.
//

import UIKit

class ImcScreen: UIView {

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension ImcScreen: ViewCodable {
    func buildHierarchy() {
        
    }
    
    func setUpConstraints() {
        
    }
    
    func render() {
        self.backgroundColor = UIColor(red: 81/255, green: 177/255, blue: 192/255, alpha: 0.75)
    }
    
    func setUpAdditionalConfiguration() {
        
    }

}
