//
//  BaseWireframe.swift
//  NY-Times
//
//  Created by Abdelrhman Eliwa on 04/12/2020.
//

import UIKit

// MARK: - BaseWireFrame (Base ViewController)
class BaseWireframe: UIViewController, NavBarProtocol {
    
    // MARK: Properties
    internal var navBarTitle: AppScreens
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar(navBarTitle: navBarTitle)
    }
    
    // MARK: inits
    init(navBarTitle: AppScreens) {
        self.navBarTitle = navBarTitle
        super.init(nibName: String(describing: type(of: self)), bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Generic Alert
extension BaseWireframe {
    func presentGenericAlert(viewController: UIViewController, title: String, message: String, doneButtonTitle: String, dismissButtonTitle: String?, completion: @escaping(_ done: Bool) -> Void = {_ in}) {
        
        if dismissButtonTitle != nil {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let doneAction = UIAlertAction(title: doneButtonTitle, style: .cancel) { (_) in
                completion(true)
            }
            let dissmisAction = UIAlertAction(title: dismissButtonTitle, style: .destructive, handler: nil)
            alert.addAction(doneAction)
            alert.addAction(dissmisAction)
            viewController.present(alert, animated: true, completion: nil)
            
        } else {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let doneAction = UIAlertAction(title: doneButtonTitle, style: .cancel) { (_) in
                completion(true)
            }
            alert.addAction(doneAction)
            viewController.present(alert, animated: true, completion: nil)
        }
    }
}
