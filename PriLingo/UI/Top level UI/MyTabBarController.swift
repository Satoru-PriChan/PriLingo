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
        let hv: CGFloat = 120
        self.view.addSubview(self.coverTabBarView(originX: 0, originY: scHeight - hv, width: scWidth, height: hv))
        self.tabBar.isHidden = true
    }
    
    ///function to return UIView to cover default UITabBar.
    func coverTabBarView(originX _x: CGFloat, originY _y: CGFloat, width _width: CGFloat, height _height: CGFloat) -> UIView {
        
        //setup view itself
        let view = UIView()
        view.frame = CGRect.init(x: _x, y: _y, width: _width, height: _height)
        view.backgroundColor = UIColor.purple
        
        //setup stackview
        let stackHeight: CGFloat = 90
        let stackWidth: CGFloat = 240
        let myStackView = UIStackView.init(frame: CGRect.init(x: (_width - stackWidth) * 0.5, y: _height - stackHeight, width: stackWidth, height: stackHeight))
        myStackView.axis = .horizontal
        myStackView.distribution = .fillEqually
        myStackView.alignment = .fill
        view.addSubview(myStackView)
        
        //setup buttons
        let leftMostBtn = self.myTabBarButton(originX: 0, originY: 0, width: stackWidth * 0.25, height: stackHeight)
        let midLeftBtn = self.myTabBarButton(originX: 0, originY: 0, width: stackWidth * 0.25, height: stackHeight)
        let midRightBtn = self.myTabBarButton(originX: 0, originY: 0, width: stackWidth * 0.25, height: stackHeight)
        let rightMostBtn = self.myTabBarButton(originX: 0, originY: 0, width: stackWidth * 0.25, height: stackHeight)
        
        leftMostBtn.tintColor = UIColor.red
        midLeftBtn.tintColor = UIColor.green
        midRightBtn.tintColor = UIColor.gray

        myStackView.addArrangedSubview(leftMostBtn)
        myStackView.addArrangedSubview(midLeftBtn)
        myStackView.addArrangedSubview(midRightBtn)
        myStackView.addArrangedSubview(rightMostBtn)
        
        return view
    }
    
    ///function to get my TabBarButton.
    func myTabBarButton(originX _x: CGFloat, originY _y: CGFloat, width _width: CGFloat, height _height: CGFloat) -> UIButton {
        let btn = UIButton.init(frame: CGRect.init(x: _x, y: _y, width: _width, height: _height))
        
        return btn
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
