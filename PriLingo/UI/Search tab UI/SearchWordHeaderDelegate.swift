//
//  SearchWordHeaderDelegate.swift
//  PriLingo
//
//  Created by USER on 2019/06/11.
//  Copyright © 2019 SoLaMi Smile. All rights reserved.
//

import UIKit

protocol SearchWordHeaderDelegate {
    
    //function called when the favorite button is tapped.
    func searchWordHeaderDelegate(touchedFavoriteButton: UIButton, searchWordHeader: SearchWordHeader)
}
