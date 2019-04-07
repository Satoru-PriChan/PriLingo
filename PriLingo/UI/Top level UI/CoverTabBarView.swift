//
//  CoverTabBarView.swift
//  PriLingo
//
//  Created by USER on 2019/04/07.
//  Copyright © 2019 SoLaMi Smile. All rights reserved.
//

import UIKit

class CoverTabBarView: UIView {
    // コードから初期化はここから
    override init(frame: CGRect) {
        super.init(frame: frame)
        comminInit()
    }
    
    // Storyboard/xib から初期化はここから
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        comminInit()
    }
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
    // xibからカスタムViewを読み込んで準備する
    private func comminInit() {
        // MyCustomView.xib からカスタムViewをロードする
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "CoverTabBarView", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        addSubview(view)
    }
    


}
