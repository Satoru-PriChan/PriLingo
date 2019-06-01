//
//  MyTabBarController.swift
//  PriLingo
//
//  Created by USER on 2019/03/20.
//  Copyright © 2019 SoLaMi Smile. All rights reserved.
//

import UIKit

///class for UITabBar for whole app.
class MyTabBarController: UITabBarController, UINavigationControllerDelegate {
    
    var myTabBarHeight: CGFloat?

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
        let viewControllers: [UINavigationController] = vCList.map {MyUINavigationController.init(rootViewController: $0)}
        
        //set delegate
        viewControllers.forEach {
            $0.delegate = self
        }
        self.viewControllers = viewControllers
        
        //add covertabbarview shape
        let scWidth = self.view.bounds.size.width
        let scHeight = self.view.bounds.size.height
        self.view.addSubview(self.coverTabBarView(originX: 0, width: scWidth, height: nil))
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
    
    ///function to return UIView to cover default UITabBar. if an input parameter height is nil, it automatially sets appropriate height.
    func coverTabBarView(originX _x: CGFloat, width _width: CGFloat, height _height: CGFloat?) -> UIView {
        
        //button size
        let buttonHeight = 54
        let buttonWidth = 60
        
        //expandLength
        let expandLength: CGFloat = 37
        
        let __height = (_height ?? (CGFloat(buttonHeight + 30)))
        
        if _height == nil {
            self.myTabBarHeight = CGFloat(buttonHeight + 30)  + expandLength * 0.7
        }
        
        let _y = UIScreen.main.bounds.size.height - __height
        
        //setup view itself
        let view = UIView()
        view.frame = CGRect.init(x: _x, y: _y, width: _width, height: __height)
        view.backgroundColor = UIColor.purple
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = self.createLengthExpandShape(expandHeight: expandLength)
        shapeLayer.fillColor = UIColor.init(patternImage: UIImage.init(named: "lace.png")!).cgColor
        view.layer.insertSublayer(shapeLayer, at: 0)
        
        //setup stackview
        let stackWidth: CGFloat = CGFloat(buttonWidth * 4)
        let stackHeight: CGFloat = CGFloat(buttonHeight)
        let myStackView = UIStackView.init(frame: CGRect.init(x: (_width - stackWidth) * 0.5, y: __height - stackHeight, width: stackWidth, height: stackHeight))
        myStackView.translatesAutoresizingMaskIntoConstraints = false
        myStackView.axis = .horizontal
        myStackView.distribution = .fillEqually
        myStackView.alignment = .fill
        view.addSubview(myStackView)
        view.addConstraints([
            NSLayoutConstraint.init(item: view, attribute: .centerX, relatedBy: .equal, toItem: myStackView, attribute: .centerX, multiplier: 1, constant: 0),
            NSLayoutConstraint.init(item: view, attribute: .centerY, relatedBy: .equal, toItem: myStackView, attribute: .centerY, multiplier: 1, constant: 0),
            NSLayoutConstraint.init(item: myStackView, attribute: .width, relatedBy: .equal, toItem: .none, attribute: .notAnAttribute, multiplier: 1, constant: CGFloat(buttonWidth/*width of button images*/ * 4)),
            NSLayoutConstraint.init(item: myStackView, attribute: .height, relatedBy: .equal, toItem: .none, attribute: .notAnAttribute, multiplier: 1, constant: CGFloat(buttonHeight)/*height of button images*/)
            
        ])
        
        //setup buttons
        let leftMostBtn = self.myTabBarButton(originX: 0, originY: 0, width: CGFloat(buttonWidth), height: CGFloat(buttonHeight))
        let midLeftBtn = self.myTabBarButton(originX: 0, originY: 0, width: CGFloat(buttonWidth), height: CGFloat(buttonHeight))
        let midRightBtn = self.myTabBarButton(originX: 0, originY: 0, width: CGFloat(buttonWidth), height: CGFloat(buttonHeight))
        let rightMostBtn = self.myTabBarButton(originX: 0, originY: 0, width: CGFloat(buttonWidth), height: CGFloat(buttonHeight))
        
        myStackView.addArrangedSubview(leftMostBtn)
        myStackView.addArrangedSubview(midLeftBtn)
        myStackView.addArrangedSubview(midRightBtn)
        myStackView.addArrangedSubview(rightMostBtn)
        
        myStackView.spacing = 10
        
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
    func createLengthExpandShape(expandHeight: CGFloat) -> CGPath {
        let path = UIBezierPath()
        
        //Starting point (left top) then draw lines until the it returns to the starting point with close().
        let startX: CGFloat = 0
        let startY: CGFloat = -1 * expandHeight
        path.move(to: CGPoint.init(x: startX, y: startY))
        path.addLine(to: CGPoint.init(x: self.view.bounds.size.width, y: startY))
        path.addLine(to: CGPoint.init(x: self.view.bounds.size.width, y: self.view.bounds.size.height))
        path.addLine(to: CGPoint.init(x: startX, y: self.view.bounds.size.height))
        path.close()
        
        return path.cgPath
    }
    
    //MARK: - UINavigationControllerDelegate
    
    ///function called when view has showed.
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        if let myNav = navigationController as? MyUINavigationController {
            ///hides left button if stack has only one view controller.
            if myNav.viewControllers.count <= 1 && myNav.myNavigationbar?.myLeftButton.isEnabled == true {
                myNav.myNavigationbar?.myLeftButton.isEnabled = false
            myNav.myNavigationbar?.myLeftButton.setBackgroundImage(UIImage.init(named: "Candy.png"), for: .normal)
                
                //debug
                print("File: \(#file) Line \(#line): Func \(#function): myNav.viewControllers.count: \(myNav.viewControllers.count), myNav.myNavigationbar?.myLeftButton.isEnabled: \(String(describing: myNav.myNavigationbar?.myLeftButton.isEnabled)) \n")
                
            //shows left button if stack has more than one view controller.
            } else if myNav.viewControllers.count >= 2 && myNav.myNavigationbar?.myLeftButton.isEnabled == false {
                myNav.myNavigationbar?.myLeftButton.isEnabled = true
            myNav.myNavigationbar?.myLeftButton.setBackgroundImage(UIImage.init(named: "BackArrow.png"), for: .normal)
                
                //debug
                print("File: \(#file) Line \(#line): Func \(#function): myNav.viewControllers.count: \(myNav.viewControllers.count), myNav.myNavigationbar?.myLeftButton.isEnabled: \(String(describing: myNav.myNavigationbar?.myLeftButton.isEnabled)) \n")
            }
            

        
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
