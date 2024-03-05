//
//  LoginViewController.swift
//  asfRazvitie
//
//  Created by Polina Popova on 04/03/2024.
//

import UIKit

class LoginViewController: UIViewController, LoginDisplayLogic {
    
    private let leadingInset: CGFloat = 55
    

    private let interactor: LoginBusinessLogic
    private let router: LoginRoutingLogic
    
    
    enum EmailTFStrings: String {
            case placeholder = ""
            case labelName = "Почта"
            case invalidText = "Неверный формат"
    }
        
    enum PasswordTFStrings: String {
            case placeholder = ""
            case labelName = "Пароль"
            case invalidText = "Неверный формат"
    }
    
    init(interactor: LoginBusinessLogic, router: LoginRoutingLogic) {
        self.interactor = interactor
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func displayInitForm(_ viewModel: Login.InitForm.ViewModel) { }
    //MARK: - ELEMENTS
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 31, weight: .heavy)
        label.text = "Вход"
        return label
    }()
    
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 32
        stackView.axis = .vertical
        return stackView
    }()
    
    private lazy var emailTextField: ValidatableTextField = {
        let textField = ValidatableTextField()
        textField.setup(title: EmailTFStrings.labelName.rawValue, placeholder: EmailTFStrings.placeholder.rawValue, invalidTitle: EmailTFStrings.invalidText.rawValue)
        return textField
    }()
    
    private lazy var passwordTextField: ValidatableTextField = {
        let textField = ValidatableTextField()
        textField.setup(title: PasswordTFStrings.labelName.rawValue, placeholder: PasswordTFStrings.placeholder.rawValue, invalidTitle: PasswordTFStrings.invalidText.rawValue)
        return textField
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Войти", for: .normal)
        button.backgroundColor = .link
        button.titleLabel?.font = .systemFont(ofSize: 16)
        button.layer.cornerRadius = 15
        button.backgroundColor = AppColors.black200
        button.titleLabel?.textColor = AppColors.black400
        
        button.addTarget(self, action: #selector(moveToMainScene), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var forgetLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.text = "Забыли пароль?"
        label.textColor = AppColors.black400
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(moveToFirstRecovery))
        label.addGestureRecognizer(tapGestureRecognizer)
        label.isUserInteractionEnabled = true
        
        return label
    }()
    
    private lazy var registerLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24, weight: .regular)
        label.text = "Ещё нет аккаунта? Создать"
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(moveToRegister))
        label.addGestureRecognizer(tapGestureRecognizer)
        label.isUserInteractionEnabled = true
        
        return label
    }()
    
    @objc func moveToMainScene() {
        router.login()
    }
    
    @objc func moveToFirstRecovery() {
        router.forgetHandleTap()
    }
    
    @objc func moveToRegister() {
        router.registerHandleTap()
    }
    //MARK: - SETUP
    
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
        setupStackView()
        setupButton()
        setupForgetPassword()
        setupRegister()
    }
    
    private func setupLabel() {
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    private func setupStackView() {
        view.addSubview(mainStackView)
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.addArrangedSubview(emailTextField)
        mainStackView.addArrangedSubview(passwordTextField)
        
        mainStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mainStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 178).isActive = true
        mainStackView.heightAnchor.constraint(equalToConstant: 184).isActive = true
        
        mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leadingInset).isActive = true
    }
    
    private func setupButton() {
        view.addSubview(loginButton)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leadingInset).isActive = true
        loginButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 621).isActive = true
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 54).isActive = true
        loginButton.widthAnchor.constraint(equalToConstant: 280).isActive = true
    }

    private func setupForgetPassword() {
        view.addSubview(forgetLabel)
        forgetLabel.translatesAutoresizingMaskIntoConstraints = false
        
        forgetLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 695).isActive = true
        forgetLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    private func setupRegister() {
        view.addSubview(registerLabel)
        registerLabel.translatesAutoresizingMaskIntoConstraints = false
        
        registerLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 731).isActive = true
        registerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
}
