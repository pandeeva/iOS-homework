//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Бардеева Надежда on 11.05.2022.
//

import UIKit

class PostTableViewCell: UITableViewCell {


    private var examplePost = Post(author: "", description: "", image: UIImage(named: "Новость1")!, likes: 1, views: 1)

    private let whiteView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()

    private let postAutorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .clear
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.numberOfLines = 2
        return label
    }()

    private let postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .black
        imageView.contentMode = .scaleAspectFit
        imageView.isUserInteractionEnabled = true
        imageView.clipsToBounds = true
        return imageView
    }()

    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .clear
        label.numberOfLines = 2 //будет столько строк текста, сколько нужно, если будет 0
        label.textColor = .systemGray
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return label
    }()

    private let likesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.textAlignment = .left
        label.isUserInteractionEnabled = true
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return label
    }()

    private let viewsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.textAlignment = .right
        label.isUserInteractionEnabled = true
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return label
    }()

    private let stackLikesViews: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .clear
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        return stackView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
        setupGestures()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    private func setupGestures() {
        let tapLike = UITapGestureRecognizer(target: self, action: #selector(likeAction))
        likesLabel.addGestureRecognizer(tapLike)
    }

    @objc private func likeAction() {
        UIView.animate(withDuration: 0.5,
                       delay: 0.0,
                       usingSpringWithDamping: 1.0,
                       initialSpringVelocity: 0.0,
                       options: .curveEaseInOut) {
            self.examplePost.likes += 1
            self.likesLabel.text = "Likes: \(self.examplePost.likes)"
        }
    }


    func setupCell(_ post: Post) {
        examplePost = post
        postAutorLabel.text = post.author
        postImageView.image = post.image
        descriptionLabel.text = post.description
        likesLabel.text = "Likes: \(post.likes)"
        viewsLabel.text = "Views: \(post.views)"
    }

    private func layout() {
        let inset: CGFloat = 16

        [likesLabel, viewsLabel].forEach{stackLikesViews.addArrangedSubview($0)}
        [postAutorLabel, postImageView, descriptionLabel, stackLikesViews].forEach{contentView.addSubview($0)}

        NSLayoutConstraint.activate([

            postAutorLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: inset),
            postAutorLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: inset),
            postAutorLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -inset),

            postImageView.topAnchor.constraint(equalTo: postAutorLabel.bottomAnchor, constant: inset),
            postImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            postImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            postImageView.heightAnchor.constraint(equalTo: contentView.widthAnchor),

            descriptionLabel.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: inset),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: inset),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -inset),

            stackLikesViews.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: inset),
            stackLikesViews.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: inset),
            stackLikesViews.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -inset),
            stackLikesViews.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -inset)
        ])
    }
}
