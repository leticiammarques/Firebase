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
    
    var tabBarCnt = UITabBarController()
    
    let listItems : [ContactModel] = [
        ContactModel(photo: "zoro", name: "Zorinho", mensage: "Tu não quer saber o que aconteceu com meu olho?", time: "15:29"),
        ContactModel(photo: "ace", name: "Maninho", mensage: "Oh seu cabeça de vento... tá no jornal de novo?! KKKKK", time: "15:29"),
        ContactModel(photo: "sanji", name: "Sanjito", mensage: "O almoço tá pronto, vem logo!", time: "15:29"),
        ContactModel(photo: "usopp", name: "Best", mensage: "Saudades do Going Marry ;(", time: "15:29")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customView.menuTabBar.delegate = self
        
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
}

extension ConversationsController: UITabBarDelegate {
    
}
