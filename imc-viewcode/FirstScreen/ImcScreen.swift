//
//  ImcScreen.swift
//  imc-viewcode
//
//  Created by Michelli Cristina de Paulo Lima on 05/09/22.
//

import UIKit

class ImcScreen: UIView {

    private let title: UILabel
    private let subtitle: UILabel
    private let weightStack: UIStackView
    private let weightLabel: UILabel
    private let weightTextField: UITextField
    private let heightStack: UIStackView
    private let heightLabel: UILabel
    private let heightTextField: UITextField
    private let calculateButton: UIButton
    private let resultView: ResultView
    var imc: Double = 0
    
    override init(frame: CGRect) {
        title = UILabel()
        subtitle = UILabel()
        weightStack = UIStackView()
        weightLabel = UILabel()
        weightTextField = UITextField()
        heightStack = UIStackView()
        heightLabel = UILabel()
        heightTextField = UITextField()
        calculateButton = UIButton()
        resultView = ResultView()
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func tappedCalculateButton() {
        if let weight = Double(weightTextField.text!), let height = Double(heightTextField.text!) {
            imc = weight / (height*height)
            showResults()
        }
    }
    
    func showResults() {
        var result: String = ""
        var image: String = ""
        
        switch imc {
            case 0..<16:
                result = "Magreza"
                image = "abaixo"
            case 16..<18.5:
                result = "Abaixo do peso"
                image = "abaixo"
            case 18.5..<25:
                result = "Peso ideal"
                image = "ideal"
            case 25..<30:
                result = "Sobrepeso"
                image = "sobre"
            default:
                result = "Obesidade"
                image = "obesidade"
        }
        resultView.resultLabel.text = result
        resultView.resultImageView.image = UIImage(named: image)
        resultView.isHidden = false
    }

}

extension ImcScreen: ViewCodable {
    func buildHierarchy() {
        self.addSubview(self.title)
        self.addSubview(self.subtitle)
        self.addSubview(weightStack)
        self.weightStack.addArrangedSubview(weightLabel)
        self.weightStack.addArrangedSubview(weightTextField)
        self.addSubview(heightStack)
        self.heightStack.addArrangedSubview(heightLabel)
        self.heightStack.addArrangedSubview(heightTextField)
        self.addSubview(calculateButton)
        self.addSubview(resultView)
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            self.title.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
            self.title.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            self.subtitle.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 10),
            self.subtitle.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            self.weightStack.topAnchor.constraint(equalTo: subtitle.bottomAnchor, constant: 10),
            self.weightStack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 80),
            
            self.weightTextField.widthAnchor.constraint(equalToConstant: 80),
            
            self.heightStack.topAnchor.constraint(equalTo: subtitle.bottomAnchor, constant: 10),
            self.heightStack.leadingAnchor.constraint(equalTo: self.weightStack.trailingAnchor, constant: 90),
            self.heightStack.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -80),
            
            self.heightTextField.widthAnchor.constraint(equalToConstant: 80),
            
            self.calculateButton.topAnchor.constraint(equalTo: heightStack.bottomAnchor, constant: 20),
            self.calculateButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 80),
            self.calculateButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -80),
            self.calculateButton.heightAnchor.constraint(equalToConstant: 60),
            
            self.resultView.topAnchor.constraint(equalTo: self.calculateButton.bottomAnchor, constant: 20),
            self.resultView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.resultView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.resultView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
    
    func update() {
        title.text = "Cálculo do IMC"
        
        subtitle.text = "Descubra o seu índice de Massa Corporal"
        
        weightLabel.text = "Peso (Kg)"
        
        weightTextField.placeholder = "Ex.: 75"
        
        heightLabel.text = "Altura (m)"
        
        heightTextField.placeholder = "Ex.: 1,75"
        
        calculateButton.setTitle("Calcular", for: .normal)
    }
    
    func render() {
        self.backgroundColor = UIColor(red: 81/255, green: 177/255, blue: 192/255, alpha: 0.75)
        
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textColor = .white
        title.font = UIFont.boldSystemFont(ofSize: 36)
        title.textAlignment = .center
        
        subtitle.translatesAutoresizingMaskIntoConstraints = false
        subtitle.textColor = .white
        subtitle.font = UIFont.systemFont(ofSize: 15)
        subtitle.textAlignment = .center
        
        weightStack.translatesAutoresizingMaskIntoConstraints = false
        weightStack.axis = .vertical
        weightStack.alignment = .center
        weightStack.spacing = 10
        
        weightLabel.translatesAutoresizingMaskIntoConstraints = false
        weightLabel.textColor = .white
        
        weightTextField.translatesAutoresizingMaskIntoConstraints = false
        weightTextField.backgroundColor = .white
        weightTextField.textColor = .darkGray
        weightTextField.borderStyle = .roundedRect
        
        heightStack.translatesAutoresizingMaskIntoConstraints = false
        heightStack.axis = .vertical
        heightStack.alignment = .center
        heightStack.spacing = 10
        
        heightLabel.translatesAutoresizingMaskIntoConstraints = false
        heightLabel.textColor = .white
        
        heightTextField.translatesAutoresizingMaskIntoConstraints = false
        heightTextField.backgroundColor = .white
        heightTextField.textColor = .darkGray
        heightTextField.borderStyle = .roundedRect
        
        calculateButton.translatesAutoresizingMaskIntoConstraints = false
        calculateButton.backgroundColor = .yellow
        calculateButton.setTitleColor(UIColor(red: 81/255, green: 177/255, blue: 192/255, alpha: 1.00), for: .normal)
        calculateButton.addTarget(self, action: #selector(tappedCalculateButton), for: .touchUpInside)

        resultView.translatesAutoresizingMaskIntoConstraints = false
        resultView.isHidden = true
    }
    
    func setUpAdditionalConfiguration() {}

}
