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
        
        //Adjusts it's height to fit custom tab bar.
        if let myTab = self.tabBarController as? MyTabBarController {
            let a = myTab.myTabBarHeight
            self.additionalSafeAreaInsets.bottom = a ?? (self.view.bounds.size.height * 0.1428)//seventh
        } else {
            self.additionalSafeAreaInsets.bottom = (self.view.bounds.size.height * 0.1428)
        }
        
        //Background image
        self.view.backgroundColor = UIColor.init(patternImage: UIImage.init(named: "BackGroundFlower.jpg")!)
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
