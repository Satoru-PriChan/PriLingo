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

    // MARK: - ViewController lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //prepare each tab
        let searchVC = SearchCategoryViewController()
        let favoritesVC = FavoritesViewController()
        let pronunciationVC = PronunciationViewController()
        let settingsVC = SettingsViewController()
        
        let vCList = [searchVC, favoritesVC, pronunciationVC, settingsVC]
        
        //change appearance of UINavigationBar
        let viewControllers: [UINavigationController] = vCList.map {UINavigationController.init(rootViewController: $0)}
        
        viewControllers.forEach {

            $0.navigationBar.barTintColor = UIColor.init(patternImage: UIImage.init(named: "PinkPolkaDot2.png")!)
            $0.navigationBar.backIndicatorImage = UIImage.init(named: "BackArrow.png")?.withRenderingMode(.alwaysOriginal)
            $0.navigationBar.backIndicatorTransitionMaskImage = UIImage.init(named: "BackArrow.png")?.withRenderingMode(.alwaysOriginal)
        }
        self.viewControllers = viewControllers
        
        //add covertabbarview shape
        let scWidth = self.view.bounds.size.width
        let scHeight = self.view.bounds.size.height
        let hv: CGFloat = scHeight * 0.1428//a seventh
        self.view.addSubview(self.coverTabBarView(originX: 0, originY: scHeight - hv, width: scWidth, height: hv))
        self.tabBar.isHidden = true

        //initially selected index
        self.selectedIndex = 0
    }
    
    ///function for when each button is tapped.
    func animateToTab(toIndex: Int) {
        if let vcTabs:[UIViewController] = self.viewControllers, let vcSelected = self.selectedViewController, let fromIndex = vcTabs.index(of: vcSelected) {
            guard fromIndex != toIndex else {return}
            
            self.selectedIndex = toIndex
            
        }
    }
    
    ///function for when leftMostBtn is tapped.
    @objc func tapLeftMost(sender:AnyObject){
        let toIndex = 0
        animateToTab(toIndex: toIndex)
    }

    ///function for when midLeftBtn is tapped.
    @objc func tapMidLeft(sender:AnyObject){
        let toIndex = 1
        animateToTab(toIndex: toIndex)
    }
    
    ///function for when midRightBtn is tapped.
    @objc func tapMidRight(sender:AnyObject){
        let toIndex = 2
        animateToTab(toIndex: toIndex)
    }
    
    ///function for when rightMostBtn is tapped.
    @objc func tapRightMost(sender:AnyObject){
        let toIndex = 3
        animateToTab(toIndex: toIndex)
    }
    
    ///function to return UIView to cover default UITabBar.
    func coverTabBarView(originX _x: CGFloat, originY _y: CGFloat, width _width: CGFloat, height _height: CGFloat) -> UIView {
        
        //setup view itself
        let view = UIView()
        view.frame = CGRect.init(x: _x, y: _y, width: _width, height: _height)
        view.backgroundColor = UIColor.purple
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = self.createLengthExpandShape()
        shapeLayer.fillColor = UIColor.init(patternImage: UIImage.init(named: "lace.png")!).cgColor
        view.layer.insertSublayer(shapeLayer, at: 0)
        
        //setup stackview
        let stackWidth: CGFloat = _width * 3 * 0.25
        let stackHeight: CGFloat = stackWidth * 0.25
        let myStackView = UIStackView.init(frame: CGRect.init(x: (_width - stackWidth) * 0.5, y: _height - stackHeight, width: stackWidth, height: stackHeight))
        myStackView.translatesAutoresizingMaskIntoConstraints = false
        myStackView.axis = .horizontal
        myStackView.distribution = .fillEqually
        myStackView.alignment = .fill
        view.addSubview(myStackView)
        view.addConstraints([
            NSLayoutConstraint.init(item: view, attribute: .centerX, relatedBy: .equal, toItem: myStackView, attribute: .centerX, multiplier: 1, constant: 0),
            NSLayoutConstraint.init(item: view, attribute: .centerY, relatedBy: .equal, toItem: myStackView, attribute: .centerY, multiplier: 1, constant: 0),
            NSLayoutConstraint.init(item: myStackView, attribute: .width, relatedBy: .equal, toItem: view, attribute: .width, multiplier: 0.8, constant: 0),
            NSLayoutConstraint.init(item: myStackView, attribute: .width, relatedBy: .equal, toItem: myStackView, attribute: .height, multiplier: 4, constant: 0)
            
        ])
        
        //setup buttons
        let leftMostBtn = self.myTabBarButton(originX: 0, originY: 0, width: stackWidth * 0.25, height: stackHeight)
        let midLeftBtn = self.myTabBarButton(originX: 0, originY: 0, width: stackWidth * 0.25, height: stackHeight)
        let midRightBtn = self.myTabBarButton(originX: 0, originY: 0, width: stackWidth * 0.25, height: stackHeight)
        let rightMostBtn = self.myTabBarButton(originX: 0, originY: 0, width: stackWidth * 0.25, height: stackHeight)
        
        myStackView.addArrangedSubview(leftMostBtn)
        myStackView.addArrangedSubview(midLeftBtn)
        myStackView.addArrangedSubview(midRightBtn)
        myStackView.addArrangedSubview(rightMostBtn)
        
        leftMostBtn.setImage(UIImage.init(named: "button1.png"), for: .normal)
        midLeftBtn.setImage(UIImage.init(named: "button2.png"), for: .normal)
        midRightBtn.setImage(UIImage.init(named: "button3.png"), for: .normal)
        rightMostBtn.setImage(UIImage.init(named: "button4.png"), for: .normal)
        
        //adjust image's position
        //let's call it a day!myStackView.arrangedSubviews.map {}
        leftMostBtn.contentHorizontalAlignment = .fill
        leftMostBtn.contentVerticalAlignment = .fill
        midLeftBtn.contentHorizontalAlignment = .fill
        midLeftBtn.contentVerticalAlignment = .fill
        midRightBtn.contentHorizontalAlignment = .fill
        midRightBtn.contentVerticalAlignment = .fill
        rightMostBtn.contentHorizontalAlignment = .fill
        rightMostBtn.contentVerticalAlignment = .fill
        
        leftMostBtn.addTarget(self, action: #selector(MyTabBarController.tapLeftMost(sender:)), for: .touchUpInside)
        midLeftBtn.addTarget(self, action: #selector(MyTabBarController.tapMidLeft(sender:)), for: .touchUpInside)
        midRightBtn.addTarget(self, action: #selector(MyTabBarController.tapMidRight(sender:)), for: .touchUpInside)
        rightMostBtn.addTarget(self, action: #selector(MyTabBarController.tapRightMost(sender:))
            , for: .touchUpInside)
        
        return view
    }
    
    ///function to get my TabBarButton.
    func myTabBarButton(originX _x: CGFloat, originY _y: CGFloat, width _width: CGFloat, height _height: CGFloat) -> UIButton {
        let btn = UIButton.init(frame: CGRect.init(x: _x, y: _y, width: _width, height: _height))
        
        return btn
    }
    
    // MARK: - Function to get CGPath
    
    /// Function to get the CGPath which expands length from original size(typically for original UITabBar).
    ///
    /// - Returns: A CGPath whose shape is expanded.
    func createLengthExpandShape() -> CGPath {
        let path = UIBezierPath()
        
        //Starting point (left top) then draw lines until the it returns to the starting point with close().
        let startX: CGFloat = 0
        let startY: CGFloat = -37
        path.move(to: CGPoint.init(x: startX, y: startY))
        path.addLine(to: CGPoint.init(x: self.view.bounds.size.width, y: startY))
        path.addLine(to: CGPoint.init(x: self.view.bounds.size.width, y: self.view.bounds.size.height))
        path.addLine(to: CGPoint.init(x: startX, y: self.view.bounds.size.height))
        path.close()
        
        return path.cgPath
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
