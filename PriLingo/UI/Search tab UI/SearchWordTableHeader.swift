//
//  SearchWordTableHeader.swift
//  PriLingo
//
//  Created by USER on 2019/06/08.
//  Copyright © 2019 SoLaMi Smile. All rights reserved.
//

import UIKit

class SearchWordTableHeader: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        loadNib()
    }
    
    func loadNib() {
        if let view = Bundle(for: type(of: self)).loadNibNamed(String(describing: type(of: self)), owner: self, options: nil)?.first as? UIView {
            view.frame = self.bounds
            view.backgroundColor = UIColor.init(patternImage: UIImage.init(named: "tableHeaderImage.png")!)
            self.addSubview(view)
        }
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
