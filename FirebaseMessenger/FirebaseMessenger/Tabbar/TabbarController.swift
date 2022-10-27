//
//  TabbarController.swift
//  FirebaseMessenger
//
//  Created by leticia marques on 06/10/22.
//

import UIKit
import RxSwift

class TabbarController: BaseViewController<TabbarView> {
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        customView.menuTabBar.delegate = self
    }
}

//extension TabbarController: UITabBarDelegate {
//
//    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
//
////        if item.title == PriviLegiusLocalized.settings {
////            let viewModel = SettingsViewModel()
////            let controller = SettingsController(viewModel: viewModel)
////            self.navigationController?.pushViewController(controller, animated: true)
////            self.navigationController?.dismiss(animated: true)
////
////        } else if item.title == PriviLegiusLocalized.newMenssage {
////            print("Nova mensagem")
////
////        } else {
////            let viewModel = ConversationsViewModel()
////            let controller = ConversationsController(viewModel: viewModel)
////            self.navigationController?.pushViewController(controller, animated: true)
////            self.navigationController?.dismiss(animated: true)
////        }
//        switch item.tag {
//            case 0:
//                let viewModel = ConversationsViewModel()
//                let controller = ConversationsController(viewModel: viewModel)
//                self.navigationController?.pushViewController(controller, animated: true)
//                self.navigationController?.dismiss(animated: true)
//                break
//            case 1:
//                print("Nova mensagem")
//                break
//            case 2:
//                let viewModel = SettingsViewModel()
//                let controller = SettingsController(viewModel: viewModel)
//                self.navigationController?.pushViewController(controller, animated: true)
//                self.navigationController?.dismiss(animated: true)
//                break
//            default:
//                print("deu ruim \(Error.self)")
//                break
//        }
//    }
//}
