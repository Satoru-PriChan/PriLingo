//
//  SearchWordTableViewCell.swift
//  PriLingo
//
//  Created by USER on 2019/05/28.
//  Copyright © 2019 SoLaMi Smile. All rights reserved.
//

import UIKit

class SearchWordTableViewCell: UITableViewCell {
    
    var delegate: SearchWordTableViewCellDelegate?

    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var PronunciationLabel: UILabel!
    
    var wordID: String?
    
    ///returns the sound path that the cell is in charge of.
    var soundPath: String {
        if self.wordID == nil || self.tag > 3 {return ""}
        
        //get file path(first half)
        let str1 = String.init(format: "%04d", Int(self.wordID!)!)
        
        //get file path (second half)
        var str2: String
        switch self.tag {
        case 0:
            str2 = Lang.Language.Japanese.rawValue
        case 1:
            str2 = Lang.Language.English.rawValue
        case 2:
            str2 = Lang.Language.SimplifiedChinese.rawValue
        case 3:
            str2 = Lang.Language.TraditionalChinese.rawValue
        default:
            return ""
        }
        
        //debug
        print("File: \(#file) Line \(#line): Func \(#function):  str1 + str2: \(str1 + str2)\n")
        
        ///use audioplayer to play.
        return str1 + "_" + str2
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    ///function to set cell values.
    func setCell(word: String?, pronounce: String?, delegate: SearchWordTableViewCellDelegate?, tag: Int, wordID: String) {
        self.wordLabel.text = word
        self.PronunciationLabel.text = pronounce
        self.delegate = delegate
        self.tag = tag
        self.wordID = wordID
    }
    
    ///function called when the play button is tapped.
    @IBAction func playButtonTapped(_ sender: UIButton) {
        self.delegate?.searchWordTableViewCell(tappedPlayButton: sender, cell: self)
        
    }
}
