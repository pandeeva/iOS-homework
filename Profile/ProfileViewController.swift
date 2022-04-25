//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Бардеева Надежда on 26.04.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    let profileHeaderView = ProfileHeaderView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(profileHeaderView)
        self.setupView()
        self.profileHeaderViewSetup()
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        view.addSubview(profileHeaderView)
        profileHeaderView.frame = view.frame
    }

    private func customizeNavBar() {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .systemGray5
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = navigationController?.navigationBar.standardAppearance
       }

       private func setupView() {
           self.view.backgroundColor = .lightGray
           self.navigationItem.title = "Profile"
           self.customizeNavBar()
       }

       private func profileHeaderViewSetup() {
           profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
           profileHeaderView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
           profileHeaderView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
           profileHeaderView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
           profileHeaderView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
     }
}
