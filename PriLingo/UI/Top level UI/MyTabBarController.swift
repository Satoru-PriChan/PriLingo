//
//  MyTabBarController.swift
//  PriLingo
//
//  Created by USER on 2019/03/20.
//  Copyright © 2019 SoLaMi Smile. All rights reserved.
//

import UIKit

///class for UITabBar for whole app.
class MyTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //prepare each tab
        let searchVC = SearchViewController()
        let favoritesVC = FavoritesViewController()
        let pronunciationVC = PronunciationViewController()
        let settingsVC = SettingsViewController()
        
        let vCList = [searchVC, favoritesVC, pronunciationVC, settingsVC]
        let viewControllers = vCList.map {UINavigationController.init(rootViewController: $0)}
        self.viewControllers = viewControllers
        
        //add covertabbarview shape
        let scWidth = self.view.bounds.size.width
        let scHeight = self.view.bounds.size.height
        let hv: CGFloat = 60
        self.view.addSubview(self.coverTabBarView(originX: 0, originY: scHeight - hv, width: scWidth, height: hv))
        self.tabBar.isHidden = true
        
        
    }
    
    func coverTabBarView(originX _x: CGFloat, originY _y: CGFloat, width _width: CGFloat, height _height: CGFloat) -> UIView {
        let view = UIView()
        view.frame = CGRect.init(x: _x, y: _y, width: _width, height: _height)
        
        return view
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
