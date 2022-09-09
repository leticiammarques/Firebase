//
//  LoginController.swift
//  FirebaseMessenger
//
//  Created by leticia marques on 09/09/22.
//

import Foundation
import UIKit
import SnapKit

class LoginController: UIViewController {
    
    let customView: LoginView = LoginView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUp()
    }

    func setUp() {
        self.view.addSubview(customView)
        customView.snp.makeConstraints{
            $0.bottom.top.left.right.equalToSuperview()
        }
    }
}
