//
//  MySearchTabView.swift
//  PriLingo
//
//  Created by USER on 2019/05/24.
//  Copyright © 2019 SoLaMi Smile. All rights reserved.
//

import UIKit

class MySearchTabView: UIView, UISearchBarDelegate {
    
    @IBOutlet weak var mySearchBar: UISearchBar!
    
    @IBOutlet weak var myAtoZLabel: UILabel!
    @IBOutlet weak var englishAtoZButton: UIButton!
    @IBOutlet weak var japaneseAtoZButton: UIButton!
    @IBOutlet weak var chineseAtoZButton: UIButton!
    
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
    
    @IBAction func englishAtoZButtonTapped(_ sender: UIButton) {
    }
    @IBAction func japaneseAtoZButtonTapped(_ sender: UIButton) {
    }
    @IBAction func chineseAtoZButtonTapped(_ sender: UIButton) {
    }
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
