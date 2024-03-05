//
//  StartSceneInteractor.swift
//  asfRazvitie
//
//  Created by Polina Popova on 04/03/2024.
//

import UIKit

final class StartScreenInteractor: StartScreenBusinessLogic, StartScreenDataStore {
    private let presenter: StartScreenPresentationLogic
    private let worker: StartScreenWorkerLogic

    init(
        presenter: StartScreenPresentationLogic,
        worker: StartScreenWorkerLogic
    ) {
        self.presenter = presenter
        self.worker = worker
    }

    func requestInitForm(_ request: StartScreen.InitForm.Request) {
        DispatchQueue.main.async {
            self.presenter.presentInitForm(StartScreen.InitForm.Response())
        }
    }
}
