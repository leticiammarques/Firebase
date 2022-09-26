//
//  BaseViewController.swift
//  FirebaseMessenger
//
//  Created by leticia marques on 16/09/22.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

enum NavigationbarContentType {
    case text(text: String)
    case image(image: UIImage)
}
enum NavigationbarPosition {
    case right
    case left
}

class BaseViewController<CustomView: UIView>: UIViewController {
    internal let baseViewModel: BaseViewModelProtocol
    internal var disposeBag: DisposeBag!
    private var placeholderView: UIView?
    private var loadedFromNib: Bool = false
    init(viewModel: BaseViewModelProtocol, nibName: String) {
        baseViewModel = viewModel
        loadedFromNib = !nibName.isEmpty
        super.init(nibName: nibName, bundle: nil)
        modalPresentationStyle = .custom
    }
    init(viewModel: BaseViewModelProtocol) {
        baseViewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        modalPresentationStyle = .custom
    }
    convenience required init?(coder aDecoder: NSCoder) {
        self.init(coder: aDecoder)
    }
    var customView: CustomView! {
        return self.view as? CustomView
    }
    override func loadView() {
        if !loadedFromNib {
            self.view = CustomView()
        } else {
            super.loadView()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftItemsSupplementBackButton = true
        navigationItem.largeTitleDisplayMode = .never
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.hidesBackButton = true
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    override var shouldAutorotate: Bool {
        return false
    }
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    deinit {
        print("dealloc ---> \(String(describing: type(of: self)))")
    }
}
