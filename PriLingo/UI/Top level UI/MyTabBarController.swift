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
        searchVC.tabBarItem = UITabBarItem.init(tabBarSystemItem: UITabBarItem.SystemItem.search, tag: 0)
        let favoritesVC = FavoritesViewController()
        favoritesVC.tabBarItem = UITabBarItem.init(tabBarSystemItem: UITabBarItem.SystemItem.favorites, tag: 1)
        let pronunciationVC = PronunciationViewController()
        pronunciationVC.tabBarItem = UITabBarItem.init(tabBarSystemItem: UITabBarItem.SystemItem.history, tag: 2)
        let settingsVC = SettingsViewController()
        settingsVC.tabBarItem = UITabBarItem.init(tabBarSystemItem: UITabBarItem.SystemItem.featured, tag: 3)
        let vCList = [searchVC, favoritesVC, pronunciationVC, settingsVC]
        let viewControllers = vCList.map {UINavigationController.init(rootViewController: $0)}
        self.viewControllers = viewControllers
        
        //change tabbar shape
        self.addTabBarShape()
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    ///change self shape.
    func addTabBarShape() {
        let _shapeLayer = CAShapeLayer()
        _shapeLayer.path = self.createPathCircle()
        _shapeLayer.strokeColor = UIColor.init(white: 0.5, alpha: 0.9).cgColor
        _shapeLayer.fillColor = UIColor.init(white: 0.5, alpha: 0.5).cgColor
        
        //this way, it can support orientation change.
        if  (self.tabBar.layer.sublayers != nil) && self.tabBar.layer.sublayers!.count != 0 {
            self.tabBar.layer.replaceSublayer(self.tabBar.layer.sublayers![0], with: _shapeLayer)
        } else {
            self.tabBar.layer.insertSublayer(_shapeLayer, at: 0)
        }
    
        
    }

    
    ///function to return CGPath that discribes half circle and straight.
    func createPathCircle() -> CGPath {
        let radius: CGFloat = 37.0
        let path = UIBezierPath()
        let centerWidth = self.tabBar.frame.width * 0.5
        
        //starting point (left top) then draw lines until the it retunrs to the starting point by close().
        path.move(to: CGPoint.init(x: 0, y: 0))
        path.addLine(to: CGPoint.init(x: (centerWidth - radius), y: 0))
        //radian = degree * π/180
        path.addArc(withCenter: CGPoint.init(x: centerWidth, y: 0), radius: radius, startAngle: CGFloat(180) * CGFloat.pi / 180, endAngle: CGFloat(0) * CGFloat.pi / 180, clockwise: false)
        path.addLine(to: CGPoint.init(x: self.tabBar.frame.width, y: 0))
        path.addLine(to: CGPoint.init(x: self.tabBar.frame.width, y: self.tabBar.frame.height))
        path.addLine(to: CGPoint.init(x: 0, y: self.tabBar.frame.height))
        path.close()
        
        return path.cgPath
        
    }
    

}
