//
//  DaoSuper.swift
//  PriLingo
//
//  Created by USER on 2019/06/09.
//  Copyright © 2019 SoLaMi Smile. All rights reserved.
//

import Foundation
import FMDB

///base class for DAO.
class DAOSuper {
    let trueInSQLite: String = "1"
    
    //convert bool into string to make it suitable for SQLite database.
    func convertBoolIntoString(_bool: Bool?) -> String {
        guard _bool != nil else {return ""}
        if _bool! {
            return self.trueInSQLite
        } else {
            return ""
        }
    }
    
    //convert string into bool to make it suitable for SQLite database.
    func convertStringIntoBool(_string: String?) -> Bool {
        guard _string != nil else {return false}
        return (_string! == self.trueInSQLite)
    }
}
