//
//  UIViewController+Ext.swift
//  Leboncoin
//
//  Created by Oscar Rodriguez Garrucho on 25/2/25
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2025 Oscar Rodriguez Garrucho. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func configureNavigationBar(withTitle title: String,
                                prefersLargeTitles: Bool,
                                barTintColor: UIColor = .systemOrange) {
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.backgroundColor = barTintColor
        appearance.shadowColor = .clear
        appearance.shadowImage = UIImage()
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        navigationController?.navigationBar.prefersLargeTitles = prefersLargeTitles
        navigationController?.navigationItem.largeTitleDisplayMode = .never
        navigationItem.title = title
        navigationItem.backButtonTitle = ""
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.isTranslucent = true
        
        navigationController?.navigationBar.overrideUserInterfaceStyle = .dark
    }
    
    func showErrorMessage(_ errorMessage: String) {
        let alert = UIAlertController(title: "Error", message: errorMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK".localize, style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
