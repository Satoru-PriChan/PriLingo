//
//  SearchCateogryTableViewCell.swift
//  PriLingo
//
//  Created by USER on 2019/05/06.
//  Copyright © 2019 SoLaMi Smile. All rights reserved.
//

import UIKit
import QuartzCore

class SearchCateogryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var theCategoryLabel: UILabel!
    @IBOutlet weak var theChapterLabel: UILabel!
    @IBOutlet weak var myBackgroundView: UIView!
    @IBOutlet weak var myBackgroundViewZero: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    ///Function to set cell
    func setCell(chapterNo: String, categoryNameEN: String?, categoryNameJP: String?, categoryNameCN_S: String?, categoryNameCN_T: String?) {
        //Chapter XX
        if let chapterLabel = self.theChapterLabel {
            chapterLabel.text = Lang.getLocalizedString(key: "chapter_firstHalf", lang: nil) + chapterNo + Lang.getLocalizedString(key: "chapter_lastHalf", lang: nil)
        }
        
        //Category name
        if let categoryLabel = self.theCategoryLabel {
            categoryLabel.text = Lang.getLocalizedString(en: categoryNameEN, jp: categoryNameJP, cn_s: categoryNameCN_S, cn_t: categoryNameCN_T, lang: nil)
        }
        
        //Round itself
        self.backgroundColor = UIColor.clear
        
        self.myBackgroundViewZero.layer.cornerRadius = 20
        self.myBackgroundViewZero.layer.masksToBounds = true
        
        self.myBackgroundView.layer.cornerRadius = 20
        self.myBackgroundView.layer.masksToBounds = true
        
        //Change appearance at being selected
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        backgroundView.layer.cornerRadius = 20
        backgroundView.layer.masksToBounds = true
        self.selectedBackgroundView = backgroundView
        
        
    }
    
}
