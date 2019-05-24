//
//  PageFlipView.swift
//  PriLingo
//
//  Created by USER on 2019/05/23.
//  Copyright © 2019 SoLaMi Smile. All rights reserved.
//

import UIKit

class PageFlipView: UIView {

    @IBOutlet weak var progressRabel: UILabel!
    @IBOutlet weak var myHorizontalSlider: UISlider!
    
    @IBOutlet weak var rewindButton: UIButton!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var fastForwardButton: UIButton!
    
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
    
    //MARK: - IB Action
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
    }
    
    @IBAction func rewindButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func playButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func fastForwardButtonTapped(_ sender: UIButton) {
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
