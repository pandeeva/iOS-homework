//
//  LogInViewController.swift
//  Navigation
//
//  Created by Бардеева Надежда on 09.05.2022.
//

import UIKit

class LogInViewController: UIViewController {

    private let colorSet: String = "#4885CC"

    private let notificationCenter = NotificationCenter.default

    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    private let contentView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .white
        return $0
    }(UIView())

    private let vcImageView: UIImageView = {
        let vcImageView = UIImageView()
        vcImageView.clipsToBounds = true
        vcImageView.translatesAutoresizingMaskIntoConstraints = false
        vcImageView.image = UIImage(named: "logo")
        return vcImageView
    }()

    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .lightGray
        stackView.axis = .vertical
        stackView.layer.masksToBounds = true
        stackView.distribution = .fillEqually
        stackView.spacing = 0.5
        stackView.layer.borderColor = UIColor.lightGray.cgColor
        stackView.layer.borderWidth = 0.5
        stackView.layer.cornerRadius = 10
        return stackView
    }()

    private let loginField: UITextField = {
        let loginField = UITextField()
        loginField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: loginField.frame.height))
        loginField.backgroundColor = .systemGray6
        loginField.placeholder = "Email or phone"
        //loginField.layer.borderColor = UIColor.lightGray.cgColor
        loginField.leftViewMode = .always
        loginField.textColor = .black
        loginField.font = .systemFont(ofSize: 16)
        loginField.tintColor = UIColor(named: "accentColor")
        loginField.autocapitalizationType = .none
        loginField.translatesAutoresizingMaskIntoConstraints = false
        return loginField
    }()

    private let passwordField: UITextField = {
        let passwordField = UITextField()
        passwordField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: passwordField.frame.height))
        passwordField.backgroundColor = .systemGray6
        passwordField.placeholder = "Password"
        passwordField.isSecureTextEntry = true
        passwordField.leftViewMode = .always
        passwordField.textColor = .black
        passwordField.font = .systemFont(ofSize: 16)
        passwordField.tintColor = UIColor(named: "accentColor")
        passwordField.autocapitalizationType = .none
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        return passwordField
    }()

    private lazy var logInBotton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = hexStringToUIColor(hex: colorSet)
        button.layer.cornerRadius = 10
        button.setTitle("Log In", for: .normal)
        button.titleLabel?.textColor = .white
        button.addTarget(self, action: #selector(onClick), for: .touchUpInside)
        return button
    }()



    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        view.backgroundColor = .white
        loginField.delegate = self
        passwordField.delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        notificationCenter.addObserver(self, selector: #selector(keyboardShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(keyboardHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        notificationCenter.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        notificationCenter.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    @objc private func keyboardShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            scrollView.contentInset.bottom = keyboardSize.height
            scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
        }
    }

    @objc private func keyboardHide() {
        scrollView.contentInset = .zero
        scrollView.verticalScrollIndicatorInsets = .zero
    }



    @objc private func onClick() {
        let vc = ProfileViewController()
        navigationController?.pushViewController(vc, animated: true)
    }

    private func hexStringToUIColor (hex:String) -> UIColor {
            var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

            if (cString.hasPrefix("#")) {
                cString.remove(at: cString.startIndex)
            }

            if ((cString.count) != 6) {
                return UIColor.gray
            }

            var rgbValue:UInt64 = 0
            Scanner(string: cString).scanHexInt64(&rgbValue)

            return UIColor(
                red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                alpha: CGFloat(1.0)
            )
        }

    private func layout() {

        view .addSubview(scrollView)
        scrollView.addSubview(contentView)

        [loginField, passwordField].forEach {stackView.addArrangedSubview($0)}

        [vcImageView, stackView, logInBotton].forEach {contentView.addSubview($0)}

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.heightAnchor.constraint(equalTo: view.heightAnchor),
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor),

            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor),

            vcImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 120),
            vcImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            vcImageView.heightAnchor.constraint(equalToConstant: 100),
            vcImageView.widthAnchor.constraint(equalToConstant: 100),

            stackView.topAnchor.constraint(equalTo: vcImageView.bottomAnchor, constant: 120),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            stackView.heightAnchor.constraint(equalToConstant: 100),

            logInBotton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 16),
            logInBotton.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            logInBotton.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            logInBotton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}

extension LogInViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
}
