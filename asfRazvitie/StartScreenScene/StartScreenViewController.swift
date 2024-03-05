//
//  StartScreenViewController.swift
//  asfRazvitie
//
//  Created by Polina Popova on 04/03/2024.
//

import UIKit

final class StartScreenViewController: UIViewController, StartScreenDisplayLogic {
    
    private let leadingInset: CGFloat = 55
    
    private let interactor: StartScreenBusinessLogic
    private let router: StartScreenRoutingLogic
    
    
    init(interactor: StartScreenBusinessLogic, router: StartScreenRoutingLogic) {
        self.interactor = interactor
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - ELEMENTS
    
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        return stackView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 25, weight: .heavy)
        //label.font = AppTypography.H1
        label.text = "Добро пожаловать"
        return label
    }()
    
    @objc private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Войти", for: .normal)
        button.backgroundColor = .link
        button.titleLabel?.font = .systemFont(ofSize: 16)
        button.layer.cornerRadius = 15
        button.backgroundColor = AppColors.black500
        button.titleLabel?.textColor =  AppColors.black100
        
        button.addTarget(self, action: #selector(moveToLoginScene), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var registerButton: UIButton = {
        let button = UIButton()
        button.setTitle("Зарегистрироваться", for: .normal)
        button.backgroundColor = .link
        button.titleLabel?.font = .systemFont(ofSize: 16)
        button.layer.cornerRadius = 15
        button.backgroundColor = AppColors.black500
        button.titleLabel?.textColor =  AppColors.black100
        
        //button.addTarget(self, action: #selector(moveToRegisterScene), for: .touchUpInside)
        
        return button
    }()
    
    
    func displayInitForm(_ viewModel: StartScreen.InitForm.ViewModel) {}
    
    
    @objc func moveToLoginScene() {
        router.login()
    }
    @objc func moveToRegisterScene() {
        router.register()
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLayout()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    private func setupLayout() {
        setupLabel()
        setupRegisterButton()
        setupLoginButton()
        
    }
    
    private func setupLabel() {
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        //titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80).isActive = true
        titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 166).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 31).isActive = true
        //titleLabel.widthAnchor.constraint(equalToConstant: 228).isActive = true
    }
    
    private func setupLoginButton() {
        view.addSubview(loginButton)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leadingInset).isActive = true
        loginButton.bottomAnchor.constraint(equalTo: registerButton.topAnchor, constant: -18).isActive = true
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 46).isActive = true
        //loginButton.widthAnchor.constraint(equalToConstant: 280).isActive = true
    }
    
    private func setupRegisterButton() {
        view.addSubview(registerButton)
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        registerButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leadingInset).isActive = true
        registerButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -99).isActive = true
        registerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        registerButton.heightAnchor.constraint(equalToConstant: 46).isActive = true
        registerButton.widthAnchor.constraint(equalToConstant: 280).isActive = true
    }

}

