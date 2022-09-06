//
//  ViewCodable.swift
//  imc-viewcode
//
//  Created by Michelli Cristina de Paulo Lima on 05/09/22.
//

import Foundation

protocol ViewCodable: AnyObject {
    func buildHierarchy()
    func setUpConstraints()
    func render()
    func setUpAdditionalConfiguration()
    func setUpView()
}

extension ViewCodable {
    func setUpView() {
        buildHierarchy()
        setUpConstraints()
        render()
        setUpAdditionalConfiguration()
    }
}
