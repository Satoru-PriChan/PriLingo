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
        
        //@@let's call it a day!@@
        
        //prepare button
        let image = UIImage.init(named: "UITabBarItem6.png")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        let image2 = UIImage.init(named: "UITabBarItem7.png")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        let image3 = UIImage.init(named: "UITabBarItem8.png")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        let image4 = UIImage.init(named: "UITabBarItem9.png")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        self.tabBar.items![0].image = image
        self.tabBar.items![1].image = image2
        self.tabBar.items![2].image = image3
        self.tabBar.items![3].image = image4
        for i in 0...self.tabBar.items!.count - 1 {
            self.tabBar.items![i].imageInsets = UIEdgeInsets.init(top: 50, left: 0, bottom: 0, right: 0)
            
        }
        
        //change tabbar shape
        self.addTabBarShape(_view: self.tabBar)
        //@@let's call it a day!
        
        //add MyTabBarView
        let myTabBarView = CoverTabBarView()
        myTabBarView.uiTabBarFrame = self.tabBar.bounds
        myTabBarView.setup()
        myTabBarView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(myTabBarView)
        self.view.addConstraints([
            NSLayoutConstraint.init(item: myTabBarView, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1.0, constant: 0),
            NSLayoutConstraint.init(item: myTabBarView, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1.0, constant: 0),
            NSLayoutConstraint.init(item: myTabBarView, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1.0, constant: 0),
            NSLayoutConstraint.init(item: myTabBarView, attribute: .height, relatedBy: .equal, toItem: self.tabBar, attribute: .height, multiplier: 1.0, constant: 0)
        ])
        self.view.layoutIfNeeded()
        
        
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
    func addTabBarShape(_view: UIView) {
        let _shapeLayer = CAShapeLayer()
        _shapeLayer.path = self.createPathCircle(startX: 0, startY: 75, width: _view.frame.width, height: _view.frame.height)
        _shapeLayer.fillColor = UIColor.init(patternImage: UIImage.init(named: "UITabBar.png")!).cgColor
        
        //this way, it can support orientation change.
        if  (_view.layer.sublayers != nil) && _view.layer.sublayers!.count != 0 {
            _view.layer.replaceSublayer(_view.layer.sublayers![0], with: _shapeLayer)
        } else {
            _view.layer.insertSublayer(_shapeLayer, at: 0)
        }
    }

    
    ///function to return CGPath that discribes half circle and straight.
    func createPathCircle(startX: CGFloat, startY: CGFloat, width: CGFloat, height: CGFloat) -> CGPath {
        let path = UIBezierPath()
        
        //starting point (left top) then draw lines until the it retunrs to the starting point by close().
        path.move(to: CGPoint.init(x: startX, y: startY))
        path.addLine(to: CGPoint.init(x: width, y: startY))
        path.addLine(to: CGPoint.init(x: width, y: height))
        path.addLine(to: CGPoint.init(x: startX, y: height))
        path.close()
        
        return path.cgPath
    }
    

}
