//
//  PostOpenedViewController.swift
//  Navigation
//
//  Created by Бардеева Надежда on 24.05.2022.
//

import UIKit

class PostOpenedViewController: UIViewController {

     var postAutorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
       // label.backgroundColor = .clear
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.numberOfLines = 0
        //label.text = "postAutorLabel"
        return label
    }()

    var postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .black
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.isUserInteractionEnabled = true
        return imageView
    }()

    var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .clear
        label.numberOfLines = 0
        label.textColor = .systemGray
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)

       // label.text = "descriptionLabel"
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = false
        layout()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
    }

    func setupVC(post: Post) {
        postAutorLabel.text = post.author
        postImageView.image = post.image
        descriptionLabel.text = post.description
    }

    private func layout() {
        self.view.backgroundColor = .white

        [postAutorLabel, postImageView, descriptionLabel].forEach({ view.addSubview($0)})

        let inset: CGFloat = 16

        NSLayoutConstraint.activate([
            postAutorLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: inset),
            postAutorLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: inset),
            postAutorLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -inset),

            postImageView.topAnchor.constraint(equalTo: postAutorLabel.bottomAnchor, constant: inset),
            postImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: inset),
            postImageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -inset),
            postImageView.heightAnchor.constraint(equalTo: postImageView.widthAnchor, multiplier: 1),

            descriptionLabel.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: inset),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: inset),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -inset)
        ])
    }
}
