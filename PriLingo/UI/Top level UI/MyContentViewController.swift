//
//  MyContentViewController.swift
//  PriLingo
//
//  Created by USER on 2019/05/26.
//  Copyright © 2019 SoLaMi Smile. All rights reserved.
//

import UIKit

class MyContentViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //Adjusts it's height to fit custom navigation bar.
        if let myNav = self.navigationController as? MyUINavigationController {
            let a: Int = (myNav.myNavigationbarHeight ?? 60)
            self.additionalSafeAreaInsets.top = CGFloat.init(Double(a))
        } else {
            self.additionalSafeAreaInsets.top = CGFloat(60)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
