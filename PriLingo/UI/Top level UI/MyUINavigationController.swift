//
//  MyUINavigationController.swift
//  PriLingo
//
//  Created by USER on 2019/05/18.
//  Copyright © 2019 SoLaMi Smile. All rights reserved.
//

import UIKit

class MyUINavigationController: UINavigationController {

    var myNavigationbar: MyNavigationBar?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //Hide default navigation bar
        self.navigationBar.isHidden = true
        
        //Add my navigation bar.
        var myNavi: MyNavigationBar?
        myNavi = MyNavigationBar.init(frame: CGRect.init(x: 0, y: 0, width: Int(UIScreen.main.bounds.size.width), height: Int(MyNavigationBar.myHeight)))
        self.view.addSubview(myNavi!)
        self.myNavigationbar = myNavi
        
        //
        
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
