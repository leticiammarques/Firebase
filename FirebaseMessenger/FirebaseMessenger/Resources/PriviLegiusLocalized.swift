//
//  FirebaseMessengerLocalized.swift
//  FirebaseMessenger
//
//  Created by leticia marques on 05/10/22.
//

import Foundation

final class PriviLegiusLocalized: NSObject {
    static var bundle: Bundle {
        Bundle(for: PriviLegiusLocalized.self)
    }
}

extension PriviLegiusLocalized {
    static private var table: String { "PriviLegius" }

    
    /// Titulo `PrivieLegius` do app
    static var titleApp: String {
        return NSLocalizedString("titleApp", tableName: table, bundle: bundle, comment: "")
    }
    
    /// Titulo `Login` do botão de login
    static var btnLogin: String {
        return NSLocalizedString("btnLogin", tableName: table, bundle: bundle, comment: "")
    }
    
    /// Titulo `Cadastro` do botão de cadastro
    static var btnRegister: String {
        return NSLocalizedString("btnRegister", tableName: table, bundle: bundle, comment: "")
    }
    
    /// Titulo `Email` do textFiel de email
    static var email: String {
        return NSLocalizedString("email", tableName: table, bundle: bundle, comment: "")
    }
    
    /// Titulo `Senha` do textFiel de senha
    static var passwd: String {
        return NSLocalizedString("passwd", tableName: table, bundle: bundle, comment: "")
    }
    
    /// Titulo `Esqueci senha` do botão de recuperar senha
    static var forgetPasswd: String {
        return NSLocalizedString("forgetPasswd", tableName: table, bundle: bundle, comment: "")
    }
    
    /// Titulo `Nome` do textField do cadastro
    static var name: String {
        return NSLocalizedString("name", tableName: table, bundle: bundle, comment: "")
    }
    
    /// Titulo `Sobrenome` do textField do cadastro
    static var lastName: String {
        return NSLocalizedString("lastName", tableName: table, bundle: bundle, comment: "")
    }
    
    /// Titulo `Confirmar senha` do textField do cadastro
    static var confirmPasswd: String {
        return NSLocalizedString("confirmPasswd", tableName: table, bundle: bundle, comment: "")
    }
    
    /// Titulo `Online` do status do usuário
    static var online: String {
        return NSLocalizedString("online", tableName: table, bundle: bundle, comment: "")
    }
    
    
    /// Titulo `Mensagem` da tabbar
    static var menssage: String {
        return NSLocalizedString("menssage", tableName: table, bundle: bundle, comment: "")
    }
    
    
    /// Titulo `Configurações` da tabbar
    static var settings: String {
        return NSLocalizedString("settings", tableName: table, bundle: bundle, comment: "")
    }
    
    
    /// Titulo `Nova mensagem` da tabbar
    static var newMenssage: String {
        return NSLocalizedString("newMenssage", tableName: table, bundle: bundle, comment: "")
    }
    
    /// Titulo `Ooooopa` dos alertas
    static var ops: String {
        return NSLocalizedString("ops", tableName: table, bundle: bundle, comment: "")
    }
    
    /// Corpo `Por favor, insira todas as informações para fazer o cadastro.` do alerta
    static var allInformationsRegister: String {
        return NSLocalizedString("allInformationsRegister", tableName: table, bundle: bundle, comment: "")
    }
    
    /// Titulo `Voltar` do botão de alerta
    static var back: String {
        return NSLocalizedString("back", tableName: table, bundle: bundle, comment: "")
    }
    
    /// Corpo `Constamos um cadastro já realizado pra esse usuário. Tente logar para acessar o PreviLegius.` do alerta
    static var registerExists: String {
        return NSLocalizedString("registerExists", tableName: table, bundle: bundle, comment: "")
    }
    
    /// Corpo `Senhas não compatíveis!"` do alerta
    static var noMatchPasswd: String {
        return NSLocalizedString("noMatchPasswd", tableName: table, bundle: bundle, comment: "")
    }
    
    /// Corpo `Email e/ou senha incorretos` do alerta
    static var errorLogin: String {
        return NSLocalizedString("errorLogin", tableName: table, bundle: bundle, comment: "")
    }
    
    /// Corpo `Por favor, insira todas as informações para fazer login.` do alerta
    static var allInformationsLogin: String {
        return NSLocalizedString("allInformationsLogin", tableName: table, bundle: bundle, comment: "")
    }
}
