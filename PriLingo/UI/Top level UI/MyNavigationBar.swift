//
//  MyNavigationBar.swift
//  PriLingo
//
//  Created by USER on 2019/05/17.
//  Copyright © 2019 SoLaMi Smile. All rights reserved.
//

import UIKit

@IBDesignable class MyNavigationBar: UIView {
    
    static let myHeight: CGFloat = 100;
    
    var delegate: MyNavigationBarDelegate?
    
    //MARK: - IB Outlet
    
    @IBOutlet weak var myBackgroundImageView: UIImageView!
    @IBOutlet weak var myLeftButton: UIButton!
    @IBOutlet weak var myTitleImage: UIImageView!
    @IBOutlet weak var myRightButton: UIButton!
    
    //MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        loadNib()
    }
    
    func loadNib() {
        let bundle = Bundle.main
        
        if let nib = bundle.loadNibNamed("MyNavigationBar", owner: self, options: nil)?.first, let view = nib as? UIView {
            view.frame = self.bounds
            self.addSubview(view)
            
            self.myBackgroundImageView.image = UIImage.init(named: "PinkPolkaDot2.png")
        }
    }

    //MARK: - IB Actions
    
    ///function for when myLeftButton is tapped.
    @IBAction func myLeftButtonTouchUpInside(_ sender: UIButton) {
        self.delegate?.myNavigationBarDelegate(touchedLeftButton: sender, myNavigationBar: self)
    }
    
    @IBAction func myRightButtonTouchUpInside(_ sender: UIButton) {
    }
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
