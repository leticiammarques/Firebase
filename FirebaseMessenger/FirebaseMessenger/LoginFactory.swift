//
//  LoginFactory.swift
//  FirebaseMessenger
//
//  Created by leticia marques on 16/09/22.
//

import Foundation
import UIKit

class LoginFactory {
    class func build() -> UIViewController {
        let viewModel = FirebaseMessengerViewModel()
        return LoginController(viewModel: viewModel)
    }
}
