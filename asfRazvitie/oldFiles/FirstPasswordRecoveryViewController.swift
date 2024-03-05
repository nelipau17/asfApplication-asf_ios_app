//
//  PasswordRecoveryViewController.swift
//  asfRazvitie
//
//  Created by Polina Popova on 28/02/2024.
//

import UIKit

class FirstPasswordRecoveryViewController: UIViewController {

    //MARK: - ENUM
    enum EmailTFStrings: String {
            case placeholder = ""
            case labelName = "Почта"
            case invalidText = "Неверный формат"
    }
    
    //MARK: - ELEMENTS
    
    private lazy var navBar: UINavigationBar = {
        let navBar = UINavigationBar()
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .white
        appearance.shadowColor = .gray
        
        let item = UINavigationItem()
        let cancelItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action:  #selector(cancel))
        cancelItem.title = "Назад"
        item.setLeftBarButton(cancelItem, animated: false)
        
        navBar.setItems([item], animated: true)
        
        return navBar
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 25, weight: .heavy)
        label.text = "Восстановление пароля"
        return label
    }()
    
    private lazy var emailTextField: ValidatableTextField = {
        let textField = ValidatableTextField()
        textField.setup(title: EmailTFStrings.labelName.rawValue, placeholder: EmailTFStrings.placeholder.rawValue, invalidTitle: EmailTFStrings.invalidText.rawValue)
        return textField
    }()
    
    private lazy var recoveryButton: UIButton = {
        let button = UIButton()
        button.setTitle("Восстановить пароль", for: .normal)
        button.backgroundColor = .link
        button.titleLabel?.font = .systemFont(ofSize: 16)
        button.layer.cornerRadius = 15
        
        button.addTarget(self, action: #selector(checkEmail), for: .touchUpInside)
        
        return button
    }()
    //MARK: - SETUP
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        //setupNavBar()
        setupEmailTextField()
        setupRecoveryButton()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    private func setupNavBar(){
        view.addSubview(navBar)
        navBar.translatesAutoresizingMaskIntoConstraints = false
        
        navBar.topAnchor.constraint(equalTo: view.topAnchor, constant: 54).isActive = true
        navBar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 8).isActive = true
        navBar.heightAnchor.constraint(equalToConstant: 44).isActive = true
    }
    
    private func setupEmailTextField() {
        view.addSubview(emailTextField)
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        emailTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 241).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant: 74).isActive = true
        emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 42).isActive = true
    }
    
    private func setupRecoveryButton() {
        view.addSubview(recoveryButton)
        recoveryButton.translatesAutoresizingMaskIntoConstraints = false
        recoveryButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        recoveryButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 621).isActive = true
        //recoveryButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 55).isActive = true
    }
    //MARK: - FUNCS
    
    @objc private func cancel() {
        dismiss(animated: true)
    }
    
    @objc private func checkEmail() {
        /*
        guard let email = emailTextField.text else { return }
        
        emailTextField.isValid = emailIsValid(email: email)
        
        guard emailIsValid(email: email) else {return}
         */
        
        let profileVC = SeondPasswordRecoveryViewController()
        profileVC.modalTransitionStyle = .flipHorizontal
        profileVC.modalPresentationStyle = .fullScreen
        
        self.present(profileVC, animated: true)
    }

}
