//
//  DSOCategory.swift
//  PriLingo
//
//  Created by USER on 2019/03/09.
//  Copyright © 2019 SoLaMi Smile. All rights reserved.
//

import Foundation
import FMDB

///Data Store Object class for Category
class DSOCategory {
    
    // MARK: - Property
    var iD: String?
    var name1: String?
    var name2: String?
    var name3: String?
    var name4: String?
    var name5: String?
    var name6: String?
    var name7: String?
    var name8: String?
    var name9: String?
    var name10: String?
    var description1: String?
    var description2: String?
    var description3: String?
    var description4: String?
    var description5: String?
    var description6: String?
    var description7: String?
    var description8: String?
    var description9: String?
    var description10: String?
    var lastUPD: String?
    var lastUPDer: String?
    var deleteFlag: String?
    var spare1: String?
    var spare2: String?
    var spare3: String?
    var spare4: String?
    var spare5: String?
    var spare6: String?
    var spare7: String?
    var spare8: String?
    var spare9: String?
    var spare10: String?
    
    ///initializer to create from FMResultSet
    init(myResultSet: FMResultSet?) {
        self.iD = myResultSet?.string(forColumn: CATEGORIES.ID)
        self.name1 = myResultSet?.string(forColumn: CATEGORIES.NAME1)
        self.name2 = myResultSet?.string(forColumn: CATEGORIES.NAME2)
        self.name3 = myResultSet?.string(forColumn: CATEGORIES.NAME3)
        self.name4 = myResultSet?.string(forColumn: CATEGORIES.NAME4)
        self.name5 = myResultSet?.string(forColumn: CATEGORIES.NAME5)
        self.name6 = myResultSet?.string(forColumn: CATEGORIES.NAME6)
        self.name7 = myResultSet?.string(forColumn: CATEGORIES.NAME7)
        self.name8 = myResultSet?.string(forColumn: CATEGORIES.NAME8)
        self.name9 = myResultSet?.string(forColumn: CATEGORIES.NAME9)
        self.name10 = myResultSet?.string(forColumn: CATEGORIES.NAME10)
        self.description1 = myResultSet?.string(forColumn: CATEGORIES.DESCRIPTION1)
        self.description2 = myResultSet?.string(forColumn: CATEGORIES.DESCRIPTION2)
        self.description3 = myResultSet?.string(forColumn: CATEGORIES.DESCRIPTION3)
        self.description4 = myResultSet?.string(forColumn: CATEGORIES.DESCRIPTION4)
        self.description5 = myResultSet?.string(forColumn: CATEGORIES.DESCRIPTION5)
        self.description6 = myResultSet?.string(forColumn: CATEGORIES.DESCRIPTION6)
        self.description7 = myResultSet?.string(forColumn: CATEGORIES.DESCRIPTION7)
        self.description8 = myResultSet?.string(forColumn: CATEGORIES.DESCRIPTION8)
        self.description9 = myResultSet?.string(forColumn: CATEGORIES.DESCRIPTION9)
        self.description10 = myResultSet?.string(forColumn: CATEGORIES.DESCRIPTION10)
        self.lastUPD = myResultSet?.string(forColumn: CATEGORIES.LAST_UPD_DATETIME)
        self.lastUPDer = myResultSet?.string(forColumn: CATEGORIES.LAST_UPDATER)
        self.deleteFlag = myResultSet?.string(forColumn: CATEGORIES.DLT_FLAG)
        self.spare1 = myResultSet?.string(forColumn: CATEGORIES.SPARE1)
        self.spare2 = myResultSet?.string(forColumn: CATEGORIES.SPARE2)
        self.spare3 = myResultSet?.string(forColumn: CATEGORIES.SPARE3)
        self.spare4 = myResultSet?.string(forColumn: CATEGORIES.SPARE4)
        self.spare5 = myResultSet?.string(forColumn: CATEGORIES.SPARE5)
        self.spare6 = myResultSet?.string(forColumn: CATEGORIES.SPARE6)
        self.spare7 = myResultSet?.string(forColumn: CATEGORIES.SPARE7)
        self.spare8 = myResultSet?.string(forColumn: CATEGORIES.SPARE8)
        self.spare9 = myResultSet?.string(forColumn: CATEGORIES.SPARE9)
        self.spare10 = myResultSet?.string(forColumn: CATEGORIES.SPARE10)

    }
    
    ///function to describe itself by print method
    func describe() {
        print("File: \(#file) Line \(#line): Func \(#function)\n  iD:\(String(describing: self.iD))" +
            "\n name1:\(String(describing: self.name1))" +
            "\n name2:\(String(describing: self.name2))" +
            "\n name3:\(String(describing: self.name3))" +
            "\n name4:\(String(describing: self.name4))" +
            "\n name5:\(String(describing: self.name5))" +
            "\n name6:\(String(describing: self.name6))" +
            "\n name7:\(String(describing: self.name7))" +
            "\n name8:\(String(describing: self.name8))" +
            "\n name9:\(String(describing: self.name9))" +
            "\n name10:\(String(describing: self.name10))" +
            "\n description1:\(String(describing: self.description1))" +
            "\n description2:\(String(describing: self.description2))" +
            "\n description3:\(String(describing: self.description3))" +
            "\n description4:\(String(describing: self.description4))" +
            "\n description5:\(String(describing: self.description5))" +
            "\n description6:\(String(describing: self.description6))" +
            "\n description7:\(String(describing: self.description7))" +
            "\n description8:\(String(describing: self.description8))" +
            "\n description9:\(String(describing: self.description9))" +
            "\n description10:\(String(describing: self.description10))")
    }
}
