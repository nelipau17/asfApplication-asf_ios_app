//
//  LoginProtocols.swift
//  asfRazvitie
//
//  Created by Polina Popova on 04/03/2024.
//

import UIKit

protocol LoginDataPassing {
    var dataStore: LoginDataStore { get }
}

protocol LoginDataStore {}

protocol LoginBusinessLogic {
    func requestInitForm(_ request: Login.InitForm.Request)
}

protocol LoginWorkerLogic {}

protocol LoginPresentationLogic {
    func presentInitForm(_ response: Login.InitForm.Response)
}

protocol LoginDisplayLogic: AnyObject {
    func displayInitForm(_ viewModel: Login.InitForm.ViewModel)
}

protocol LoginRoutingLogic {
    func login()
    func forgetHandleTap()
    func registerHandleTap()
    func emailIsValid(email: String) -> Bool
    func passwordIsValid(password: String) -> Bool
}
