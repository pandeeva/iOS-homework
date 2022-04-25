//
//  InfoViewController.swift
//  Navigation
//
//  Created by Бардеева Надежда on 26.04.2022.
//

import UIKit

class InfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        makeButton()
    }

    private func makeButton() {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
        button.center = view.center
        button.setTitle("Назад", for: .normal)
        button.backgroundColor = .black
        button.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
        view.addSubview(button)
    }

    @objc private func tapAction() {
        let alert = UIAlertController(title: "Перейти назад", message: "Вы точно хотите перейти назад?", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Выйти", style: .default) { _ in
            self.dismiss(animated: true)
        }
        let cancelAction = UIAlertAction(title: "Отмена", style: .destructive)
        alert.addAction(cancelAction)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
