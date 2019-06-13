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
    
    ///variable to represent repeat state of the repeat button.
    var repeatButtonState: RepeatState = .None
    
    var delegate: TitleAndButtonViewDelegate?
    
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
        
        //color
        self.backgroundColor = UIColor.clear
    }


    @IBAction func playRepeatButton(_ sender: UIButton) {
        //change repeat state
        switch self.repeatButtonState {
        case .None:
            self.repeatButtonState = .RepeatAll
        self.playRepeatButton.setBackgroundImage(UIImage.init(named: "repeat-all.png"), for: .normal)
        case .RepeatAll:
            self.repeatButtonState = .RepeatOne
        self.playRepeatButton.setBackgroundImage(UIImage.init(named: "repeat-one-track.png"), for: .normal)
        case .RepeatOne:
            self.repeatButtonState = .None
        self.playRepeatButton.setBackgroundImage(UIImage.init(named: "repeat-none.png"), for: .normal)
            
        }
        
        //do something needed by owner.
        self.delegate?.titleAndButtonView(tappedRepeatButton: sender, repeatState: self.repeatButtonState)
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
