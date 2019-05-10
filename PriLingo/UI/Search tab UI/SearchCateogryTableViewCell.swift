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
        self.layer.cornerRadius = 20
        self.layer.masksToBounds = true
        
    }
    
}
