//
//  LoginRouter.swift
//  asfRazvitie
//
//  Created by Polina Popova on 04/03/2024.
//

import Foundation
import UIKit

final class LoginRouter: LoginRoutingLogic, LoginDataPassing {
    
    weak var viewController: UIViewController?
    let dataStore: LoginDataStore

    init(dataStore: LoginDataStore) {
        self.dataStore = dataStore
    }
    
    @objc func login() {
        let loginVC = LoginAssembly.build()
        viewController?.navigationController?.pushViewController(loginVC, animated: true)
    }
    
    @objc func forgetHandleTap() {
        let forgetVC = FirstPasswordRecoveryViewController()
        viewController?.navigationController?.pushViewController(forgetVC, animated: true)
    }
    
    @objc func registerHandleTap() {
        let registerVC = RegisterViewController()
        viewController?.navigationController?.pushViewController(registerVC, animated: true)
    }
    
    func emailIsValid(email: String) -> Bool {
        let pattern = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        guard email.range(of: pattern, options: .regularExpression) != nil else {
            return false
        }
        return true
    }
    
    func passwordIsValid(password: String) -> Bool {
        let pattern = "^(?=.*[A-Z].*[A-Z])(?=.*[0-9].*[0-9])(?=.*[a-z].*[a-z].*[a-z]).{8}$"
        
        guard password.range(of: pattern, options: .regularExpression) != nil else {
            return false
        }
        return true
    }
    
    
    
}

private extension LoginRouter {

}
