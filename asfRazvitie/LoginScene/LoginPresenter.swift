//
//  LoginPresenter.swift
//  asfRazvitie
//
//  Created by Polina Popova on 04/03/2024.
//

final class LoginPresenter: LoginPresentationLogic {
    weak var view: LoginDisplayLogic?

    func presentInitForm(_ response: Login.InitForm.Response) {
        view?.displayInitForm(Login.InitForm.ViewModel())
    }
}
