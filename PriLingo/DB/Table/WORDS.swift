//
//  WORDS.swift
//  PriLingo
//
//  Created by USER on 2019/03/06.
//  Copyright © 2019 SoLaMi Smile. All rights reserved.
//

import Foundation

//class for table that represents each word, expression, or phrase.
class WORDS {
    // MARK: - Table name
    public static let MST_WORDS = "MST_WORDS"
    
    // MARK: - Column name
    public static let ID = WORDS.MST_WORDS + SuperTable._ID
    public static let T_CATEGORIES_ID = WORDS.MST_WORDS + "_" + CATEGORIES.ID
}
