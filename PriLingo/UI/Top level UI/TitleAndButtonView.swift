//
//  TitleAndButtonView.swift
//  PriLingo
//
//  Created by USER on 2019/05/25.
//  Copyright © 2019 SoLaMi Smile. All rights reserved.
//

import UIKit

class TitleAndButtonView: UIView {
    
    @IBOutlet weak var myTitleLabel: UILabel!
    
    @IBOutlet weak var playRepeatButton: UIButton!
    
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
            self.addSubview(view)
        }
    }


    @IBAction func playRepeatButton(_ sender: UIButton) {
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
