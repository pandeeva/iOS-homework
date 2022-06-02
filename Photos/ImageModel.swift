//
//  ImageModel.swift
//  Navigation
//
//  Created by Бардеева Надежда on 24.05.2022.
//

import UIKit

var photoGalery: [UIImage] = {
    var photoGalery = [UIImage]()
    for photo in 1...20 {
        photoGalery.append(UIImage(named: "\(photo)")!)
    }
    return photoGalery
}()
