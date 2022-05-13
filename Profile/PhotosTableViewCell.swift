//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Бардеева Надежда on 13.05.2022.
//

import UIKit

protocol PhotosTableViewCellDelegate: AnyObject {
    func tapAction()
}

class PhotosTableViewCell: UITableViewCell {
     weak var delegate: PhotosTableViewCellDelegate?

    var photos: [String] = []

    private let titleLable: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.text = "Photos"
        return label
    }()

    private lazy var photosButton: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .clear
        button.setImage(UIImage(named: "arrow.right"), for: .normal)
        button.tintColor = .black
        button.addTarget(self, action: #selector(openPhotoGallery), for: .touchUpInside)
        return button
    }()



    private let photoCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal

        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
//        collection.register(PhotosCollectionProfileViewCell.self, forCellWithReuseIdentifier: PhotosCollectionProfileViewCell.identifier)
        collection.backgroundColor = .clear
        return collection
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc private func openPhotoGallery() {
        delegate?.tapAction()
    }

    func setupCell(_ title: String) {
        titleLable.text = title
    }

    private func layout() {
        [titleLable, photosButton, photoCollection].forEach{contentView.addSubview($0)}

        let inset: CGFloat = 12
        photoCollection.delegate = self
        photoCollection.dataSource = self

        NSLayoutConstraint.activate([
            titleLable.topAnchor.constraint(equalTo: contentView.topAnchor, constant: inset),
            titleLable.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: inset),

            photosButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -inset),
            photosButton.centerYAnchor.constraint(equalTo: titleLable.centerYAnchor),

            photoCollection.topAnchor.constraint(equalTo: titleLable.bottomAnchor, constant: inset),
            photoCollection.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: inset ),
            photoCollection.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -inset),
            photoCollection.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -inset ),
            photoCollection.heightAnchor.constraint(equalToConstant: 90)
        ])
    }
}

// MARK: - UICollectionViewDataSource

extension PhotosTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosCollectionProfileViewCell.identifier, for: indexPath) as! PhotosCollectionProfileViewCell
//        cell.setupCell(photos[indexPath.item])
  //      return cell
        return UICollectionViewCell()
    }


}
// MARK: - UICollectionViewDelegateFlowLayout

extension PhotosTableViewCell: UICollectionViewDelegateFlowLayout {
    var sideInset: CGFloat { return 8 }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = (collectionView.bounds.width - sideInset * 5) / 4
        return CGSize(width: height, height: height)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sideInset
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return sideInset
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.section, indexPath.item)
    }
}
