//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Бардеева Надежда on 26.04.2022.
//

import UIKit

class ProfileHeaderView: UIView {
    
    private var fotoProfileView: UIImageView = {
        let fotoProfileView = UIImageView()
        fotoProfileView.layer.borderColor = UIColor.white.cgColor
        fotoProfileView.layer.borderWidth = 3
        fotoProfileView.layer.cornerRadius = 60
        fotoProfileView.layer.masksToBounds = true
        fotoProfileView.image = UIImage(named: "IMG_3290 Small")
        fotoProfileView.contentMode = .scaleAspectFill
        fotoProfileView.translatesAutoresizingMaskIntoConstraints = false
        return fotoProfileView
    }()

    private var nickNameLabel: UILabel = {
        let nickNameLabel = UILabel()
        nickNameLabel.text = "Sweet Shelly"
        nickNameLabel.textColor = .black
        nickNameLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        nickNameLabel.translatesAutoresizingMaskIntoConstraints = false
        return nickNameLabel
    }()

    private var statusLabel: UILabel = {
        let statusLabel = UILabel()
        statusLabel.text = "Waiting for something..."
        statusLabel.textColor = .gray
        statusLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        return statusLabel
    }()

    private lazy var showStatusButton: UIButton = {
        let showStatusButton = UIButton()
        showStatusButton.setTitle("Show status", for: .normal)
        showStatusButton.backgroundColor = .systemBlue
        showStatusButton.titleLabel?.textColor = .white
        showStatusButton.layer.cornerRadius = 4
        showStatusButton.layer.shadowColor = UIColor.black.cgColor
        showStatusButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        showStatusButton.layer.shadowRadius = 4
        showStatusButton.layer.shadowOpacity = 0.7
        showStatusButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        showStatusButton.translatesAutoresizingMaskIntoConstraints = false
        return showStatusButton
    }()

    @objc private func buttonPressed() {
           print (statusLabel.text ?? "nil")
       }

    func setupConstraints() {
        // добавляем ограничения для fotoProfileView
        fotoProfileView.widthAnchor.constraint(equalToConstant: 120).isActive = true
        fotoProfileView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        fotoProfileView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16).isActive = true
        fotoProfileView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true

        //добавляем ограничения для nickNameLabel
        nickNameLabel.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor, constant: 27).isActive = true
        nickNameLabel.leftAnchor.constraint(equalTo: fotoProfileView.rightAnchor, constant: 16).isActive = true
        nickNameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true

        // добавляем ограничения для showStatusButton
        showStatusButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        showStatusButton.topAnchor.constraint(equalTo: fotoProfileView.bottomAnchor, constant: 16).isActive = true
        showStatusButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
        showStatusButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true

        // добавляем ограничения для statusLabel
        statusLabel.bottomAnchor.constraint(equalTo: showStatusButton.topAnchor, constant: -34).isActive = true
        statusLabel.leftAnchor.constraint(equalTo: fotoProfileView.rightAnchor, constant: 16).isActive = true
        statusLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
    }

    func setupView() {
        self.addSubview(fotoProfileView)
        self.addSubview(nickNameLabel)
        self.addSubview(showStatusButton)
        self.addSubview(statusLabel)
        setupConstraints()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
