//
//  PostViewController.swift
//  Navigation
//
//  Created by Бардеева Надежда on 26.04.2022.
//

import UIKit

class PostViewController: UIViewController {
    var titlePost: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupController()
    }

    private func setupController() {
        self.view.backgroundColor = .cyan
        self.navigationItem.title = titlePost // вставили заголовок контроллера
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Информация", style: .plain, target: self, action: #selector(viewPost))
    }

    @objc private func viewPost() {
        let infoViewController = InfoViewController()
        present(infoViewController, animated: true)
    }

}
