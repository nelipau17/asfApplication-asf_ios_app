//
//  StartScreenProtocols.swift
//  asfRazvitie
//
//  Created by Polina Popova on 04/03/2024.
//

import UIKit

protocol StartScreenDataPassing {
    var dataStore: StartScreenDataStore { get }
}

protocol StartScreenDataStore {}

protocol StartScreenBusinessLogic {
    func requestInitForm(_ request: StartScreen.InitForm.Request)
}

protocol StartScreenWorkerLogic {}

protocol StartScreenPresentationLogic {
    func presentInitForm(_ response: StartScreen.InitForm.Response)
}

protocol StartScreenDisplayLogic: AnyObject {
    func displayInitForm(_ viewModel: StartScreen.InitForm.ViewModel)
}

protocol StartScreenRoutingLogic {
    func login()
    func register()
}
