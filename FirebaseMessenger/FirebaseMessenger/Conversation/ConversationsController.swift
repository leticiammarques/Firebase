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

    let listItems : [ContactModel] = [
        ContactModel(photo: "zoro", name: "Zorinho", mensage: "Tu não quer saber o que aconteceu com meu olho?", time: "15:29"),
        ContactModel(photo: "ace", name: "Maninho", mensage: "Oh seu cabeça de vento... tá no jornal de novo?! KKKKK", time: "15:29"),
        ContactModel(photo: "sanji", name: "Sanjito", mensage: "O almoço tá pronto, vem logo!", time: "15:29"),
        ContactModel(photo: "usopp", name: "Best", mensage: "Saudades do Going Marry ;(", time: "15:29")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        customView.tabbar.menuTabBar.delegate = self
        customView.tabbar.menuTabBar.tag = 0
        
        customView.chatTableView.dataSource = self
        customView.chatTableView.delegate = self
    }    
}

extension ConversationsController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ConversationChatCell.customCell, for: indexPath) as! ConversationChatCell
        let model = self.listItems[indexPath.row]
        
        cell.photoPerson.image = UIImage(named: model.photo)
        cell.namePerson.text = model.name
        cell.mensagePerson.text = model.mensage
        cell.hoursSend.text = model.time

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let model = self.listItems[indexPath.row]
//        let chat = ContactModel(photo: model.photo, name: model.name, mensage: model.mensage, time: model.time)
//        
//        let controllerChat = ChatController(coder: NSCoder)
//        self.navigationController?.pushViewController(controllerChat, animated: true)
//        
    }
}

extension ConversationsController: UITabBarDelegate {

    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {

        if item.title == PriviLegiusLocalized.settings {
            let viewModel = SettingsViewModel()
            let controller = SettingsController(viewModel: viewModel)
            self.navigationController?.pushViewController(controller, animated: true)
            self.navigationController?.dismiss(animated: true)

        } else if item.title == PriviLegiusLocalized.newMenssage {
            print("Nova mensagem")

        }
    }
}
