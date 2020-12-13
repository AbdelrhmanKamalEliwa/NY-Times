//
//  NavBarProtocol.swift
//  NY-Times
//
//  Created by Abdelrhman Eliwa on 04/12/2020.
//

import UIKit

// MARK: - NavBarTitleProtocol
protocol NavBarProtocol: UIViewController {
    var navBarTitle: AppScreens { get set }
    func setupNavBar(navBarTitle: AppScreens)
}

extension NavBarProtocol {
    // MARK: Properties
    var navBar: UINavigationBar {
        return self.navigationController!.navigationBar
    }
    
    // MARK: Setup NavBar
    func setupNavBar(navBarTitle: AppScreens) {
        navBar.barTintColor = UIColor(named: "AppYellow")!
        navBar.tintColor = UIColor(named: "AppBlack1")
        navBar.prefersLargeTitles = false
        let title = navBarTitle.rawValue
        let titleAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor(named: "AppBlack1")!
        ]
        navBar.titleTextAttributes = titleAttributes
        navigationItem.title = title
    }
}
