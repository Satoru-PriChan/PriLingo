//
//  SearchWordTableHeader.swift
//  PriLingo
//
//  Created by USER on 2019/06/08.
//  Copyright © 2019 SoLaMi Smile. All rights reserved.
//

import UIKit

class SearchWordHeader: UIView {
    
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    
    var delegate: SearchWordHeaderDelegate?
    
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
            
            view.backgroundColor = UIColor.init(patternImage: UIImage.init(named: "headerImage.png")!)
        }
        
        
    }

    //MARK: - IB function
    
    ///function called when a favorite button is tapped.
    @IBAction func tappedFavoriteButton(_ sender: UIButton) {
        self.delegate?.searchWordHeaderDelegate(touchedFavoriteButton: sender, searchWordHeader: self)
    }
    
    //MARK: - Other methods
    
    ///function to change Favorite button appearance. if isFavorite is nil or false, set ash-colored image. if not, set normal image.
    func changeFavoriteButtonApperance(isFavorite: Bool?) {
        if isFavorite == nil || !isFavorite! {
            self.favoriteButton.setBackgroundImage(UIImage.init(named: "AshHeart.png"), for: .normal)
        } else {
            self.favoriteButton.setBackgroundImage(UIImage.init(named: "Heart.png"), for: .normal)
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
