//
//  TopLevelUIExtensions.swift
//  PriLingo
//
//  Created by USER on 2019/05/16.
//  Copyright © 2019 SoLaMi Smile. All rights reserved.
//

import Foundation
import UIKit

extension UIBarButtonItem {
    
    ///function to get bigger UIBarButtonItem
    static func menuButton(_ target: Any?, action: Selector?, imageName: String) -> UIBarButtonItem {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: imageName)?.withRenderingMode(.alwaysOriginal), for: .normal)
        if action != nil {
            button.addTarget(target, action: action!, for: .touchUpInside)
        }
        
        let menuBarItem = UIBarButtonItem(customView: button)
        menuBarItem.customView?.translatesAutoresizingMaskIntoConstraints = false
        menuBarItem.customView?.heightAnchor.constraint(equalToConstant: 80).isActive = true
        menuBarItem.customView?.widthAnchor.constraint(equalToConstant: 80).isActive = true
        
        return menuBarItem
    }
}

extension UIViewController {
    //function to pass to leftBarButtonItem
    @objc func popSelf() {
        self.navigationController?.popViewController(animated: true)
    }
}
