//
//  LoginDelegate.swift
//  Navigation
//
//  Created by Бардеева Надежда on 23.05.2022.
//

import Foundation

protocol LoginDelegate: AnyObject {
    func buttonPressed()
    func wrongLoginAlert()
}
