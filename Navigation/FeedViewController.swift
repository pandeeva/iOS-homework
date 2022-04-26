//
//  FeedViewController.swift
//  Navigation
//
//  Created by Бардеева Надежда on 26.04.2022.
//

import UIKit

class FeedViewController: UIViewController {

    var post = Post(title: "Просмотр поста")

    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .cyan
        stackView.axis = .vertical // вертикальная растяжка вьюх, можно выбрать горизонтал
        stackView.distribution = .equalCentering
        stackView.spacing = 10
        return stackView
    }()

    private lazy var buttonOne: UIButton = {
        let buttonOne = UIButton()
        buttonOne.setTitle("Press this button", for: .normal)
        buttonOne.backgroundColor = .black
        buttonOne.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
        return buttonOne
    }()

    private lazy var buttonTwo: UIButton = {
        let buttonTwo = UIButton()
        buttonTwo.setTitle("No, press this button", for: .normal)
        buttonTwo.backgroundColor = .black
        buttonTwo.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
        return buttonTwo
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        layout()
    }

    private func layout() {
        view.addSubview(stackView)
        [buttonOne, buttonTwo].forEach { stackView.addArrangedSubview($0)}

        stackView.setCustomSpacing(10, after: buttonOne)

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 220),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 100),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }

    @objc private func tapAction() {
        let vc = PostViewController()
        vc.titlePost = post.title
        navigationController?.pushViewController(vc, animated: true)
    }

}
