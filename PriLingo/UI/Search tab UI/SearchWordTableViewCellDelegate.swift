//
//  SearchWordTableViewCellDelegate.swift
//  PriLingo
//
//  Created by 999-503 on 2019/06/12.
//  Copyright © 2019 SoLaMi Smile. All rights reserved.
//

import UIKit

///delegate protocol for SearchWordTableViewCell.
protocol SearchWordTableViewCellDelegate {
    ///function called when the play button is tapped.
    func searchWordTableViewCell(tappedPlayButton: UIButton, cell: SearchWordTableViewCell)
}
