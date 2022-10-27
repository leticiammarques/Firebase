//
//  SettingsView.swift
//  FirebaseMessenger
//
//  Created by leticia marques on 03/10/22.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa
import RxRelay

class SettingsView: BaseView {
    
    var tabbar: TabbarView = {
        let tab = TabbarView()
        return tab
    }()
    
    init() {
        super.init(frame: CGRect.zero)
        self.setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setup() {
        self.addSubview(tabbar)

        
        self.backgroundColor = .white
        
        tabbar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tabbar.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tabbar.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            tabbar.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -3),
            tabbar.heightAnchor.constraint(equalToConstant: 54)
        ])
    }
}
