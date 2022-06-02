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
        avatarImageView.layer.masksToBounds = false
        avatarImageView.clipsToBounds = true
        avatarImageView.isUserInteractionEnabled = true
        avatarImageView.image = UIImage(named: "IMG_3290 Small")
        avatarImageView.contentMode = .scaleAspectFill
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        return avatarImageView
    }()

    private var avatarImageViewForAnimation: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view

    }()

    private var fullNameLabel: UILabel = {
        let fullNameLabel = UILabel()
        fullNameLabel.text = "Sweet Shelly"
        fullNameLabel.textColor = .black
        fullNameLabel.font = .systemFont(ofSize: 18, weight: .bold)
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

    private var blackView: UIView = {
        let view = UIView()
        view.frame = UIScreen.main.bounds
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        view.alpha = 0.0
        view.isUserInteractionEnabled = true
        return view
    }()

    private lazy var closeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .clear
        button.setImage(UIImage(named: "xmark"), for: .normal)
        button.alpha = 0.0
        button.addTarget(self, action: #selector(closeAvatar), for: .touchUpInside)
        return button
    }()

    @objc private func buttonPressed() {
        guard let textField = statusTextField.text else { return }
        if textField.isEmpty {
            statusTextField.shakeField()
        } else {
        statusLabel.text = statusText
        print (statusLabel.text ?? "nil")
        }
    }

    @objc private func statusLabelChanged (_ textField: UITextField) {
        if let text = textField.text {
            statusText = text
        }
    }

    @objc private func closeAvatar() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.0, options: .curveEaseInOut) {
            self.closeButton.alpha = 0
        } completion: { _ in
            self.blackView.alpha = 0.0
            self.avatarImageView.layer.borderWidth = 3
            self.avatarImageView.layer.position = self.avatarImageViewForAnimation.layer.position
            self.avatarImageView.layer.bounds = CGRect(x: 0, y: 0, width: 120, height: 120)
            self.avatarImageView.layer.cornerRadius = self.avatarImageView.bounds.width / 2
            self.layoutIfNeeded()
        }
    }

    @objc private func tapAvatar() {
        UIImageView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseInOut) {
            self.blackView.alpha = 0.7
            self.avatarImageView.layer.bounds = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
            self.avatarImageView.center = CGPoint(x: self.blackView.center.x, y: self.blackView.center.y - 55)
            self.avatarImageView.layer.cornerRadius = 0
            self.avatarImageView.layer.borderWidth = 0
            self.layoutIfNeeded()
        } completion: { _ in
            UIImageView.animate(withDuration: 0.3, delay: 0) {
                self.closeButton.layer.opacity = 1
            }
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
        setupGestures()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupGestures() {
        let tapGestureImage = UITapGestureRecognizer(target: self, action: #selector(tapAvatar))
        avatarImageView.addGestureRecognizer(tapGestureImage)
    }

    private func layout() {
        [fullNameLabel, statusLabel, setStatusButton, statusTextField,avatarImageViewForAnimation, blackView,fullNameLabel,
         avatarImageView, closeButton].forEach{ addSubview($0)}

        NSLayoutConstraint.activate([
            avatarImageView.widthAnchor.constraint(equalToConstant: 120),
            avatarImageView.heightAnchor.constraint(equalToConstant: 120),
            avatarImageView.safeAreaLayoutGuide.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),

            avatarImageViewForAnimation.widthAnchor.constraint(equalToConstant: 120),
            avatarImageViewForAnimation.heightAnchor.constraint(equalToConstant: 120),
            avatarImageViewForAnimation.safeAreaLayoutGuide.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            avatarImageViewForAnimation.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),

            closeButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10),
            closeButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            closeButton.widthAnchor.constraint(equalToConstant: 30),
            closeButton.heightAnchor.constraint(equalToConstant: 30),

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
}
