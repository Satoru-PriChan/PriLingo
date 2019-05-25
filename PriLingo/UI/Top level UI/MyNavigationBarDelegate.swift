//
//  MyNavigationBarDelegate.swift
//  PriLingo
//
//  Created by USER on 2019/05/22.
//  Copyright © 2019 SoLaMi Smile. All rights reserved.
//

import Foundation
import UIKit

protocol MyNavigationBarDelegate {
    
    ///function for when MyNavigationBar's left button is tapped.
    func myNavigationBarDelegate(touchedLeftButton: UIButton, myNavigationBar: MyNavigationBar)
}
