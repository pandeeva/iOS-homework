//
//  FeedViewController.swift
//  Navigation
//
//  Created by Бардеева Надежда on 26.04.2022.
//

import UIKit

class FeedViewController: UIViewController {

    var post = Post(title: "Просмотр поста") //  создали экз структуры


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
        makeButton()
    }

    private func makeButton() {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
        button.center = view.center
        button.setTitle("Посмотреть пост", for: .normal)
        button.backgroundColor = .black
        button.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
        view.addSubview(button)
    }

    @objc private func tapAction() {
        let vc = PostViewController()
        vc.titlePost = post.title
        navigationController?.pushViewController(vc, animated: true)
    }
}
