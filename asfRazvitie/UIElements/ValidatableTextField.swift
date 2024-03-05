//
//  ValidatableTextField.swift
//  asfRazvitie
//
//  Created by Polina Popova on 28/02/2024.
//

import UIKit

class ValidatableTextField: UIStackView {

    private let validTextFieldColor: UIColor =  AppColors.black100
    private let invalidTextFieldColor: UIColor = AppColors.red300
    
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .regular)
        
        return label
    }()
    
    private lazy var textField: InsetedTextField = {
        let textField = InsetedTextField()
        textField.backgroundColor = validTextFieldColor
        textField.font = .systemFont(ofSize: 17, weight: .regular)
        textField.layer.cornerRadius = 15
        
        return textField
    }()
    
    private lazy var invalidLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .light)
        label.textColor = AppColors.red300
        label.isHidden = true
        
        return label
    }()
    
    var isValid: Bool = true {
        didSet {
            invalidLabel.isHidden = isValid
            textField.backgroundColor = isValid ? validTextFieldColor : invalidTextFieldColor
        }
    }
    
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
    
    func setup(title: String, placeholder: String, invalidTitle: String) {
        titleLabel.text = title
        textField.placeholder = placeholder
        //textField.frame = CGRect(x: 10, y: 10, width: 200, height: 44)
        textField.borderStyle = .roundedRect
        textField.backgroundColor = AppColors.white
        invalidLabel.text = invalidTitle
    }
    
    private func setupLayout() {
        backgroundColor = .white
        spacing = 16
        axis = .vertical
        
        addArrangedSubview(titleLabel)
        addArrangedSubview(textField)
        addArrangedSubview(invalidLabel)
        setCustomSpacing(8, after: textField)
    }

}
