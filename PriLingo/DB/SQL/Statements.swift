//
//  Statements.swift
//  PriLingo
//
//  Created by USER on 2019/03/06.
//  Copyright © 2019 SoLaMi Smile. All rights reserved.
//

import Foundation

//class for SQL statements
class Statements {
    // MARK: - T_CATEGORIES
    public static let SELECT_ALL_T_CATEGORIES = ""
    + "SELECT * FROM "
    + CATEGORIES.T_CATEGORIES
    + ";"
    
    // MARK: - MST_WORDS
    public static let SELECT_ALL_MSTWORDS = ""
    + "SELECT * FROM "
    + WORDS.MST_WORDS + " "
    + "WHERE "
    + WORDS.T_CATEGORIES_ID + " = ?"
    + ";"
    
    public static let UPDATE_WORD_FAVORITE = ""
        + "UPDATE "
        + WORDS.MST_WORDS + " "
        + "SET "
        + WORDS.FAVORITE + " = ? "
        + "WHERE "
        + WORDS.ID + " = ?"
        + ";"
    
    
}
