//
//  LoginAssembly.swift
//  asfRazvitie
//
//  Created by Polina Popova on 04/03/2024.
//

import UIKit

enum LoginAssembly {
    static func build() -> UIViewController {
        let presenter = LoginPresenter()
        let worker = LoginWorker()
        let interactor = LoginInteractor(presenter: presenter, worker: worker)
        let router = LoginRouter(dataStore: interactor)
        let viewController = LoginViewController(interactor: interactor, router: router)

        presenter.view = viewController
        router.viewController = viewController

        return viewController
    }
}
