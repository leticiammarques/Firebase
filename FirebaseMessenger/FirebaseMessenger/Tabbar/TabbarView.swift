//
//  TabbarView.swift
//  FirebaseMessenger
//
//  Created by leticia marques on 06/10/22.
//

import UIKit
import RxSwift

class TabbarView: BaseView {
    
    var menuTabBar: UITabBar = {
        var tab = UITabBar()
        tab.setItems([
            UITabBarItem.init(title: PriviLegiusLocalized.menssage, image: UIImage.init(systemName: "bubble.right.fill"), tag: 0),
            UITabBarItem.init(title: PriviLegiusLocalized.newMenssage, image: UIImage.init(systemName: "plus.bubble.fill"), tag: 1),
            UITabBarItem.init(title: PriviLegiusLocalized.settings, image: UIImage.init(systemName: "gearshape.fill"), tag: 2
            )], animated: true)
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
        self.addSubview(menuTabBar)
        
        menuTabBar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            menuTabBar.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            menuTabBar.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            menuTabBar.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            menuTabBar.topAnchor.constraint(equalTo: self.topAnchor),
            menuTabBar.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
}
