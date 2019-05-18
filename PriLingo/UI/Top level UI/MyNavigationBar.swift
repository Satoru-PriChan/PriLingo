//
//  MyNavigationBar.swift
//  PriLingo
//
//  Created by USER on 2019/05/17.
//  Copyright © 2019 SoLaMi Smile. All rights reserved.
//

import UIKit

class MyNavigationBar: UIView {
    
    //MARK: - IB Outlet
    
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var titleImage: UIImageView!
    @IBOutlet weak var rightButton: UIButton!
    
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
        if let view = Bundle(for: type(of: self)).loadNibNamed(String(describing: type(of: self)), owner: self, options: nil)?.first as? UIView {
            view.frame = self.bounds
            self.addSubview(view)
        }
    }

    //MARK: - IB Actions
    
    ///Function for when the left button is tapped.
    @IBAction func LeftButtonTapped(_ sender: UIButton) {
    }
    
    ///Funtion for when the right button is tapped.
    @IBAction func rightButtonTapped(_ sender: UIButton) {
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
