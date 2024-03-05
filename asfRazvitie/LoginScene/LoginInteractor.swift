//
//  LoginInteractor.swift
//  asfRazvitie
//
//  Created by Polina Popova on 04/03/2024.
//

import UIKit

final class LoginInteractor: LoginBusinessLogic, LoginDataStore {
    private let presenter: LoginPresentationLogic
    private let worker: LoginWorkerLogic

    init(
        presenter: LoginPresentationLogic,
        worker: LoginWorkerLogic
    ) {
        self.presenter = presenter
        self.worker = worker
    }

    func requestInitForm(_ request: Login.InitForm.Request) {
        DispatchQueue.main.async {
            self.presenter.presentInitForm(Login.InitForm.Response())
        }
    }
}

