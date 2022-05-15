//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Бардеева Надежда on 26.04.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    private let photoNameArray: [String] = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20"]


     private var section: [String] {["Photos", "Post"]}
     private var posts = Post.makeMockModelPost()

    private var profileHeaderView: UIView = {
        let view = ProfileHeaderView()
        return view
    }()



    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.identifier )
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: PhotosTableViewCell.identifier )
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        setupViewController()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupViewController()
        navigationController?.navigationBar.isHidden = true
    }

    private func customizeNavigationBar() {
            let appearance = UINavigationBarAppearance()
            appearance.backgroundColor = .white
            navigationController?.navigationBar.isTranslucent = false
            navigationController?.navigationBar.standardAppearance = appearance
            navigationController?.navigationBar.scrollEdgeAppearance = navigationController?.navigationBar.standardAppearance
        }

    private func setupViewController() {
            self.view.backgroundColor = .white
            self.navigationItem.title = "Profile"
            self.customizeNavigationBar()
        }

    private func layout() {

        view.addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])

    }

}

// MARK: - UITableViewDataSource
extension ProfileViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
       return section.count

    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 1 : posts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: PhotosTableViewCell.identifier, for: indexPath) as! PhotosTableViewCell
            cell.delegate = self
            cell.photos = photoNameArray
            cell.setupCell(section[0])
            cell.selectionStyle = .none
            return cell
        }
       // tableView.sectionHeaderHeight = 0
        let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier, for: indexPath) as! PostTableViewCell
        cell.setupCell(posts[indexPath.row])

        cell.selectionStyle = .none
        return cell

    }
}

//MARK: - UITableViewDelegate
extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        tableView.sectionHeaderHeight = 0

        return section == 0 ? profileHeaderView : nil

    }

    func tableView(_ tableView: UITableView,
    didEndDisplayingHeaderView view: UIView, forSection section: Int ) {

    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? 220 : 0
      }
}


extension ProfileViewController: PhotosTableViewCellDelegate {
    func tapAction() {
        let photosVC = PhotosViewController()
        photosVC.photos = photoNameArray
        navigationController?.pushViewController(photosVC, animated: true)
    }


}
