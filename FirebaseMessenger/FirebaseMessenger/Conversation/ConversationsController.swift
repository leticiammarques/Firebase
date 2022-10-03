//
//  ConversationsController.swift
//  FirebaseMessenger
//
//  Created by leticia marques on 09/09/22.
//

import Foundation
import FirebaseAuth
import RxSwift
import UIKit

class ConversationsController: BaseViewController<ConversationsView> {
    
    var tabBarCnt: UITabBarController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customView.chatTableView.dataSource = self
        customView.chatTableView.delegate = self
    }

//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//
//
//        //        validateAuth()
//
//    }
    
    func createTabBarController() {
        tabBarCnt = UITabBarController()
        
        let messagesVC = self
        messagesVC.title = "Messages"
        messagesVC.tabBarItem = UITabBarItem.init(title: "Messages", image: UIImage.init(systemName: "bubble.right.fill"), tag: 0)
        
        let settingsVC = UIViewController()
        settingsVC.title = "Settings"
        settingsVC.view.backgroundColor = .red
        settingsVC.tabBarItem = UITabBarItem.init(title: "Settings", image: UIImage.init(systemName: "gearshape.fill"), tag: 1)
        
        let controllerArray = [messagesVC, settingsVC]
        tabBarCnt.viewControllers = controllerArray.map {UINavigationController.init(rootViewController: $0)}
//        self.view.addSubview(tabBarCnt.view)
//        customView.menuTabBar.addSubview(tabBarCnt.view)
    }
}

extension ConversationsController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ConversationChatCell.customCell, for: indexPath) as! ConversationChatCell
//        cell.customImageView.image = UIImage(named: pokemon[indexPath.row])
//        cell.titleImage.text = pokemon[indexPath.row]
//        cell.backgroundColor = colorList[indexPath.row]
        return cell
    }

    
}

//class TabBarConversations: UITabBarController {
//    
//    let tabBarCnt = UITabBarController()
//    
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        
//        createTabBarController()
//    }
//    
//    func createTabBarController() {
//        let messagesVC = self
//        messagesVC.title = "Messages"
//        messagesVC.tabBarItem = UITabBarItem.init(title: "Messages", image: UIImage.init(systemName: "bubble.right.fill"), tag: 0)
//        
//        let settingsVC = self
//        settingsVC.title = "Settings"
//        settingsVC.tabBarItem = UITabBarItem.init(title: "Settings", image: UIImage.init(systemName: "gearshape.fill"), tag: 1)
//        
//        let controllerArray = [messagesVC, settingsVC]
//        self.viewControllers = controllerArray.map {UINavigationController.init(rootViewController: $0)}
//    }
//}
