//
//  RegisterController.swift
//  FirebaseMessenger
//
//  Created by leticia marques on 09/09/22.
//

import Foundation
import UIKit

class RegisterController: UIViewController {
    
    let customView: RegisterView = RegisterView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
        self.setUp()
    }

    func setUp() {
        self.view.addSubview(customView)
        customView.snp.makeConstraints{
            $0.bottom.top.left.right.equalToSuperview()
        }
    }
    
}
