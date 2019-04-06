//
//  MyTabBarView.swift
//  PriLingo
//
//  Created by USER on 2019/04/06.
//  Copyright © 2019 SoLaMi Smile. All rights reserved.
//

import UIKit

///class that is used to cover original tab bar.
@IBDesignable class MyTabBarView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadFromNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadFromNib()
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    //function to instantiate from reusable xib file.
    private func loadFromNib() {
        let v = UINib(nibName: "MyTabBarView", bundle: Bundle(for: MyTabBarView.self)).instantiate(withOwner: self, options: nil)[0] as! UIView
        v.frame = self.bounds
        addSubview(v)
    }
    
    ///function called when IB is set.
    override func prepareForInterfaceBuilder() {
        self.loadFromNib()
    }

}
