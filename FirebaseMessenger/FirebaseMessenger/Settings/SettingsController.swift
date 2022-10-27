//
//  SettingsController.swift
//  FirebaseMessenger
//
//  Created by leticia marques on 03/10/22.
//

import UIKit
import RxSwift


class SettingsController: BaseViewController<SettingsView>{
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        customView.tabbar.menuTabBar.delegate = self
        customView.tabbar.menuTabBar.tag = 2
    }
}

extension SettingsController: UITabBarDelegate {

    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {

        print("FUNCIONAAAAA \(item)")

        if item.title == PriviLegiusLocalized.menssage {
            let viewModel = ConversationsViewModel()
            let controller = ConversationsController(viewModel: viewModel)
            self.navigationController?.pushViewController(controller, animated: true)
            self.navigationController?.dismiss(animated: true)

        } else if item.title == PriviLegiusLocalized.newMenssage {
            print("Nova mensagem")

        }
    }
}
