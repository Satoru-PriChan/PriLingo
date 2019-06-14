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
