//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Бардеева Надежда on 26.04.2022.
//

import UIKit

class ProfileHeaderView: UIView {
    
    private var avatarImageView: UIImageView = {
        let avatarImageView = UIImageView()
        avatarImageView.layer.borderColor = UIColor.white.cgColor
        avatarImageView.layer.borderWidth = 3
        avatarImageView.layer.cornerRadius = 60
        avatarImageView.layer.masksToBounds = true
        avatarImageView.image = UIImage(named: "IMG_3290 Small")
        avatarImageView.contentMode = .scaleAspectFill
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        return avatarImageView
    }()

    private var fullNameLabel: UILabel = {
        let fullNameLabel = UILabel()
        fullNameLabel.text = "Sweet Shelly"
        fullNameLabel.textColor = .black
        fullNameLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        fullNameLabel.translatesAutoresizingMaskIntoConstraints = false
        return fullNameLabel
    }()

    private var statusLabel: UILabel = {
        let statusLabel = UILabel()
        statusLabel.text = "Waiting for something..."
        statusLabel.textColor = .gray
        statusLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        return statusLabel
    }()

    private lazy var setStatusButton: UIButton = {//переменная ленивая, потому что в addTarget используем self
        let setStatusButton = UIButton()
        setStatusButton.setTitle("Show status", for: .normal)
        setStatusButton.backgroundColor = .systemBlue
        setStatusButton.titleLabel?.textColor = .white
        setStatusButton.layer.cornerRadius = 4
        setStatusButton.layer.shadowColor = UIColor.black.cgColor
        setStatusButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        setStatusButton.layer.shadowRadius = 4
        setStatusButton.layer.shadowOpacity = 0.7
        setStatusButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        setStatusButton.translatesAutoresizingMaskIntoConstraints = false
        return setStatusButton
    }()

    private var statusText:String = ""

    @objc private func buttonPressed() {
        statusLabel.text = statusText
        print (statusLabel.text ?? "nil")
    }

    private lazy var statusTextField: UITextField = {
        let statusTextField = UITextField()
        statusTextField.backgroundColor = .white
        statusTextField.layer.borderColor = UIColor.black.cgColor
        statusTextField.layer.borderWidth = 1
        statusTextField.layer.cornerRadius = 12
        statusTextField.textColor = .black
        statusTextField.textAlignment = .left
        statusTextField.font = .systemFont(ofSize: 15, weight: .regular)
        statusTextField.addTarget(self, action: #selector(statusLabelChanged), for: .editingChanged)
        statusTextField.translatesAutoresizingMaskIntoConstraints = false
        return statusTextField
    }()

    @objc private func statusLabelChanged (_ textField: UITextField) {
        if let text = textField.text {
            statusText = text
        }
    }

    private func layout() {
        [avatarImageView, fullNameLabel, statusLabel, setStatusButton, statusTextField].forEach{ addSubview($0)}

        NSLayoutConstraint.activate([
            avatarImageView.widthAnchor.constraint(equalToConstant: 120),
            avatarImageView.heightAnchor.constraint(equalToConstant: 120),
            avatarImageView.safeAreaLayoutGuide.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            avatarImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            fullNameLabel.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor, constant: 27),
            fullNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),
            fullNameLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            statusLabel.bottomAnchor.constraint(equalTo: setStatusButton.topAnchor, constant: -55),
            statusLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),
            statusLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            setStatusButton.heightAnchor.constraint(equalToConstant: 50),
            setStatusButton.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 16),
            setStatusButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            setStatusButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            statusTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 142),
            statusTextField.topAnchor.constraint(equalTo: self.setStatusButton.topAnchor, constant: -50),
            statusTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            statusTextField.heightAnchor.constraint(equalToConstant: 40)
        ])

    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
