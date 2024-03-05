//
//  InsetedTextField.swift
//  asfRazvitie
//
//  Created by Polina Popova on 28/02/2024.
//

import UIKit

class InsetedTextField: UITextField {

    let padding = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8);

        override func textRect(forBounds bounds: CGRect) -> CGRect {
            return bounds.inset(by: padding)
        }

        override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
            return bounds.inset(by: padding)
        }

        override func editingRect(forBounds bounds: CGRect) -> CGRect {
            return bounds.inset(by: padding)
        }

}
