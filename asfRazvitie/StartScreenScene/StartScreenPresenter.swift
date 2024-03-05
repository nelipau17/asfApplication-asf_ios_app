//
//  StartScreenPresenter.swift
//  asfRazvitie
//
//  Created by Polina Popova on 04/03/2024.
//

final class StartScreenPresenter: StartScreenPresentationLogic {
    weak var view: StartScreenDisplayLogic?

    func presentInitForm(_ response: StartScreen.InitForm.Response) {
        view?.displayInitForm(StartScreen.InitForm.ViewModel())
    }
}
