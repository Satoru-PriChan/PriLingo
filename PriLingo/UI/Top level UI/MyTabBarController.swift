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
        
        //prepare button
        let image = UIImage.init(named: "UITabBarItem.png")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        self.tabBar.items![0].image = image
        
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
    
    ///change tabbar-like shape.
    func addTabBarShape() {
        let _shapeLayer = CAShapeLayer()
      _shapeLayer.path = self.createPathCircle()
        _shapeLayer.fillColor = UIColor.init(patternImage: UIImage.init(named: "UITabBar.png")!).cgColor
        
        //this way, it can support orientation change.
        if  (self.tabBar.layer.sublayers != nil) && self.tabBar.layer.sublayers!.count != 0 {
            self.tabBar.layer.replaceSublayer(self.tabBar.layer.sublayers![0], with: _shapeLayer)
        } else {
            self.tabBar.layer.insertSublayer(_shapeLayer, at: 0)
        }
        
        //for background Image
        /*
        if self.tabBar.subviews.count != 0 && self.tabBar.subviews[0].layer.sublayers != nil && self.tabBar.subviews[0].layer.sublayers!.count != 0{
            self.tabBar.subviews[0].layer.replaceSublayer(self.tabBar.subviews[0].layer.sublayers![0], with: _shapeLayer)
        } else {
            self.tabBar.subviews[0].layer.insertSublayer(_shapeLayer, at: 0)
        }*/
    
        
    }

    
    ///function to return CGPath that discribes half circle and straight.
    func createPathCircle() -> CGPath {
        let path = UIBezierPath()
        
        //starting point (left top) then draw lines until the it retunrs to the starting point by close().
        let startX: CGFloat = 0
        let startY: CGFloat = -100
        path.move(to: CGPoint.init(x: startX, y: startY))
        path.addLine(to: CGPoint.init(x: self.tabBar.frame.width, y: startY))
        path.addLine(to: CGPoint.init(x: self.tabBar.frame.width, y: self.tabBar.frame.height))
        path.addLine(to: CGPoint.init(x: startX, y: self.tabBar.frame.height))
        path.close()
        
        return path.cgPath
    }
    

}
