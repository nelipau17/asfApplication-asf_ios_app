//
//  StartScreenAssembly.swift
//  asfRazvitie
//
//  Created by Polina Popova on 04/03/2024.
//

import UIKit

enum StartScreenAssembly {
    static func build() -> UIViewController {
        let presenter = StartScreenPresenter()
        let worker = StartScreenWorker()
        let interactor = StartScreenInteractor(presenter: presenter, worker: worker)
        let router = StartScreenRouter(dataStore: interactor)
        let viewController = StartScreenViewController(interactor: interactor, router: router)

        presenter.view = viewController
        router.viewController = viewController

        return viewController
    }
}
