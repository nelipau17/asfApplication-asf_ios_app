//
//  LoginViewController.swift
//  asfRazvitie
//
//  Created by Polina Popova on 28/02/2024.
//
/*
import UIKit

class OLDLoginViewController: UIViewController {

    private let leadingInset: CGFloat = 42
    
    //MARK: - ENUM
    
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
        
        button.addTarget(self, action: #selector(login), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var forgetLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.text = "Забыли пароль?"
        label.textColor = AppColors.black400
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(forgetHandleTap))
        label.addGestureRecognizer(tapGestureRecognizer)
        label.isUserInteractionEnabled = true
        
        return label
    }()
    
    private lazy var registerLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24, weight: .regular)
        label.text = "Ещё нет аккаунта? Создать"
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(registerHandleTap))
        label.addGestureRecognizer(tapGestureRecognizer)
        label.isUserInteractionEnabled = true
        
        return label
    }()
    
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
    
    //MARK: - AWERSOME FUNCTIONS
    
    @objc private func login() {
        /*
        guard let email = emailTextField.text,
              let password = passwordTextField.text else { return }
        
        emailTextField.isValid = emailIsValid(email: email)
        passwordTextField.isValid = passwordIsValid(password: password)
        
        guard emailIsValid(email: email), passwordIsValid(password: password) else {return}
         */
        
        let profileVC = MainScreenViewController()
        profileVC.modalTransitionStyle = .flipHorizontal
        profileVC.modalPresentationStyle = .fullScreen
        
        self.present(profileVC, animated: true)
    }
    
    @objc private func forgetHandleTap() {
        
        let profileVC = FirstPasswordRecoveryViewController()
        profileVC.modalTransitionStyle = .flipHorizontal
        profileVC.modalPresentationStyle = .fullScreen
        self.present(profileVC, animated: true)
        
        print("Label was tapped!")
        
    }
    
    @objc private func registerHandleTap() {
        
        let profileVC = RegisterViewController()
        profileVC.modalTransitionStyle = .flipHorizontal
        profileVC.modalPresentationStyle = .fullScreen
        self.present(profileVC, animated: true)
        
        print("Label was tapped!!")
        
    }
    //MARK: - CHECK FUNC
    
    private func emailIsValid(email: String) -> Bool {
        let pattern = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        guard email.range(of: pattern, options: .regularExpression) != nil else {
            return false
        }
        return true
    }
    
    private func passwordIsValid(password: String) -> Bool {
        let pattern = "^(?=.*[A-Z].*[A-Z])(?=.*[0-9].*[0-9])(?=.*[a-z].*[a-z].*[a-z]).{8}$"
        
        guard password.range(of: pattern, options: .regularExpression) != nil else {
            return false
        }
        return true
    }
}
*/
