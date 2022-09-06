//
//  ResultView.swift
//  imc-viewcode
//
//  Created by Michelli Cristina de Paulo Lima on 06/09/22.
//

import UIKit

class ResultView: UIView {
    
    let explanationLabel: UILabel
    var resultLabel: UILabel
    var resultImageView: UIImageView
    
    override init(frame: CGRect) {
        explanationLabel = UILabel()
        resultLabel = UILabel()
        resultImageView = UIImageView()
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension ResultView: ViewCodable {
    func buildHierarchy() {
        self.addSubview(explanationLabel)
        self.addSubview(resultLabel)
        self.addSubview(resultImageView)
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            self.explanationLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
            self.explanationLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            self.resultLabel.topAnchor.constraint(equalTo: self.explanationLabel.bottomAnchor, constant: 30),
            self.resultLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),

            self.resultImageView.topAnchor.constraint(equalTo: self.resultLabel.bottomAnchor, constant: 30),
            self.resultImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 30),
        ])
    }
    
    func update() {
        explanationLabel.text = "Seu índice de Massa Corporal é"
        
        resultLabel.text = "Resultado"
    }
    
    func render() {
        self.backgroundColor = .white
        
        explanationLabel.translatesAutoresizingMaskIntoConstraints = false
        explanationLabel.textColor = .gray
        
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        resultLabel.font = UIFont.boldSystemFont(ofSize: 24)
        
        resultImageView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setUpAdditionalConfiguration() {}
    
}
