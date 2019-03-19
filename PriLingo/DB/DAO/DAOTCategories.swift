//
//  DAOTCategories.swift
//  PriLingo
//
//  Created by USER on 2019/03/09.
//  Copyright © 2019 SoLaMi Smile. All rights reserved.
//

import Foundation
import FMDB

///class of Data Accessing Object for T_CATGORIES.
class DAOTCategories {
    
    /// function to SELECT * FROM T_CATEGORIES
    ///
    /// - Returns: Array of DSOCategory. if some error occurred, returns nil. if there were no data, returns empty array.
    func exeSelect() -> Array<DSOCategory>? {
        var myResultSet: FMResultSet? = nil
        var DSOCategories: Array<DSOCategory> = []

        let myDB = FMDatabase.init(path: Path.libDB)
        myDB.open()

        //execute SELECT query
        do {
            myResultSet = try myDB.executeQuery(Statements.SELECT_ALL_T_CATEGORIES, values: nil)
        } catch {
            //debug
            print("File: \(#file) Line \(#line): Func \(#function):  select query failed. SQL: \(Statements.SELECT_ALL_T_CATEGORIES)")
            return nil
        }
        
        //you can force myResultSet unwrapped, cause it already passed thorugh do-catch clause.
        while myResultSet!.next() {
            let newCategory = DSOCategory.init(myResultSet: myResultSet)
            DSOCategories.append(newCategory)
        }
        
        myDB.close()
        
        return DSOCategories
    }
}

