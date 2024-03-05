//
//  EnterTextField.swift
//  asfRazvitie
//
//  Created by Polina Popova on 28/02/2024.
//

import UIKit

class EnterTextField: UIStackView {

    private let validTextFieldColor: UIColor =  AppColors.black100
    private let invalidTextFieldColor: UIColor = AppColors.red300
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .regular)
        
        return label
    }()
    
    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = validTextFieldColor
        textField.frame = CGRect(x: 0, y: 0, width: 361, height: 36)
        textField.font = .systemFont(ofSize: 17, weight: .regular)
        textField.layer.cornerRadius = 15
        
        return textField
    }()
    
    
    
    var text: String? {
        textField.text
    }
    
    init() {
        super.init(frame:.zero)
        setupLayout()
    }
    
    required init(coder: NSCoder) {
        fatalError("AAAAAAAA")
    }
    
    func setup(title: String, placeholder: String) {
        titleLabel.text = title
        textField.placeholder = placeholder
    }
    
    private func setupLayout() {
        backgroundColor = .white
        spacing = 16
        axis = .vertical
        
        addArrangedSubview(titleLabel)
        addArrangedSubview(textField)
        setCustomSpacing(8, after: textField)
    }

}
