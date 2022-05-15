//
//  ProfileTableHederView.swift
//  Navigation
//
//  Created by Бардеева Надежда on 13.05.2022.
//

import UIKit

class ProfileTableHederView: UIViewController {

    private let profileHeaderView: UIView = {
         let view = ProfileHeaderView()
         view.translatesAutoresizingMaskIntoConstraints = false
         return view
     }()

     private var newButton: UIButton = {
         let newButton = UIButton()
         newButton.setTitle("New button", for: .normal)
         newButton.backgroundColor = .systemBlue
         newButton.titleLabel?.textColor = .white
         newButton.translatesAutoresizingMaskIntoConstraints = false
         return newButton
     }()

     override func viewDidLoad() {
         super.viewDidLoad()
         self.setupView()
         layoutProfileHeaderView()
     }

     override func viewWillLayoutSubviews() {
         super.viewWillLayoutSubviews()
     }

     private func customizeNavBar() {
         let appearance = UINavigationBarAppearance()
         appearance.backgroundColor = .systemGray5
         navigationController?.navigationBar.standardAppearance = appearance
         navigationController?.navigationBar.scrollEdgeAppearance = appearance
        }

     private func setupView() {
         self.view.backgroundColor = .lightGray
         self.customizeNavBar()
     }

     private func layoutProfileHeaderView() {

         [profileHeaderView, newButton].forEach{view.addSubview($0)}

         profileHeaderView.frame = view.frame

         NSLayoutConstraint.activate([
         profileHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
         profileHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
         profileHeaderView.heightAnchor.constraint(equalToConstant: 220),
         profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
         newButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
         newButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
         newButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
         ])
     }
}
