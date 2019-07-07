//
//  DSOWords.swift
//  PriLingo
//
//  Created by USER on 2019/03/09.
//  Copyright © 2019 SoLaMi Smile. All rights reserved.
//

import Foundation
import FMDB

class DSOWord {
    // MARK: - Properties
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
    var phonetic1: String?
    var phonetic2: String?
    var phonetic3: String?
    var phonetic4: String?
    var phonetic5: String?
    var phonetic6: String?
    var phonetic7: String?
    var phonetic8: String?
    var phonetic9: String?
    var phonetic10: String?
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
    var categoryID: String?
    var favorite: String?
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

    ///Initializer from FMResultSet
    init(myResultSet: FMResultSet) {
        self.iD = myResultSet.string(forColumn: WORDS.ID)
        self.name1 = myResultSet.string(forColumn: WORDS.NAME1)
        self.name2 = myResultSet.string(forColumn: WORDS.NAME2)
        self.name3 = myResultSet.string(forColumn: WORDS.NAME3)
        self.name4 = myResultSet.string(forColumn: WORDS.NAME4)
        self.name5 = myResultSet.string(forColumn: WORDS.NAME5)
        self.name6 = myResultSet.string(forColumn: WORDS.NAME6)
        self.name7 = myResultSet.string(forColumn: WORDS.NAME7)
        self.name8 = myResultSet.string(forColumn: WORDS.NAME8)
        self.name9 = myResultSet.string(forColumn: WORDS.NAME9)
        self.name10 = myResultSet.string(forColumn: WORDS.NAME10)
        self.phonetic1 = myResultSet.string(forColumn: WORDS.PHONETIC1)
        self.phonetic2 = myResultSet.string(forColumn: WORDS.PHONETIC2)
        self.phonetic3 = myResultSet.string(forColumn: WORDS.PHONETIC3)
        self.phonetic4 = myResultSet.string(forColumn: WORDS.PHONETIC4)
        self.phonetic5 = myResultSet.string(forColumn: WORDS.PHONETIC5)
        self.phonetic6 = myResultSet.string(forColumn: WORDS.PHONETIC6)
        self.phonetic7 = myResultSet.string(forColumn: WORDS.PHONETIC7)
        self.phonetic8 = myResultSet.string(forColumn: WORDS.PHONETIC8)
        self.phonetic9 = myResultSet.string(forColumn: WORDS.PHONETIC9)
        self.phonetic10 = myResultSet.string(forColumn: WORDS.PHONETIC10)
        self.description1 = myResultSet.string(forColumn: WORDS.DESCRIPTION1)
        self.description2 = myResultSet.string(forColumn: WORDS.DESCRIPTION2)
        self.description3 = myResultSet.string(forColumn: WORDS.DESCRIPTION3)
        self.description4 = myResultSet.string(forColumn: WORDS.DESCRIPTION4)
        self.description5 = myResultSet.string(forColumn: WORDS.DESCRIPTION5)
        self.description6 = myResultSet.string(forColumn: WORDS.DESCRIPTION6)
        self.description7 = myResultSet.string(forColumn: WORDS.DESCRIPTION7)
        self.description8 = myResultSet.string(forColumn: WORDS.DESCRIPTION8)
        self.description9 = myResultSet.string(forColumn: WORDS.DESCRIPTION9)
        self.description10 = myResultSet.string(forColumn: WORDS.DESCRIPTION10)
        self.categoryID = myResultSet.string(forColumn: WORDS.T_CATEGORIES_ID)
        self.favorite = myResultSet.string(forColumn: WORDS.FAVORITE)
        self.lastUPD = myResultSet.string(forColumn: WORDS.LAST_UPD_DATETIME)
        self.lastUPDer = myResultSet.string(forColumn: WORDS.LAST_UPDATER)
        self.deleteFlag = myResultSet.string(forColumn: WORDS.DLT_FLAG)
        self.spare1 = myResultSet.string(forColumn: WORDS.SPARE1)
        self.spare2 = myResultSet.string(forColumn: WORDS.SPARE2)
        self.spare3 = myResultSet.string(forColumn: WORDS.SPARE3)
        self.spare4 = myResultSet.string(forColumn: WORDS.SPARE4)
        self.spare5 = myResultSet.string(forColumn: WORDS.SPARE5)
        self.spare6 = myResultSet.string(forColumn: WORDS.SPARE6)
        self.spare7 = myResultSet.string(forColumn: WORDS.SPARE7)
        self.spare8 = myResultSet.string(forColumn: WORDS.SPARE8)
        self.spare9 = myResultSet.string(forColumn: WORDS.SPARE9)
        self.spare10 = myResultSet.string(forColumn: WORDS.SPARE10)
    }
    
    ///function to get a word's name, phonetic, and description in this order according to the parameter's language.
    func getNameInPreferredLanguage(lang: Lang.Language?) -> (String?, String?, String?)? {
        
        //return default value (in English)
        guard lang != nil else {return (self.name2, self.phonetic2, self.description2)}
        
        switch lang! {
        case .Japanese:
            return (self.name1, self.phonetic1, self.description1)
        case .English:
            return (self.name2, self.phonetic2, self.description2)
        case .SimplifiedChinese:
            return (self.name3, self.phonetic3, self.description3)
        case .TraditionalChinese:
            return (self.name4, self.phonetic4, self.description4)
        }
    }
    
    ///describe itself by print method
    func describe() {
        print("File: \(#file) Line \(#line): Func \(#function):" +
            "\n  self.iD: \(String(describing: self.iD))" +
            "\n  name1: \(String(describing: self.name1))" +
            "\n  name2: \(String(describing: self.name2))" +
            "\n  name3: \(String(describing: self.name3))" +
            "\n  name4: \(String(describing: self.name4))" +
            "\n  name5: \(String(describing: self.name5))" +
            "\n  name6: \(String(describing: self.name6))" +
            "\n  name7: \(String(describing: self.name7))" +
            "\n  name8: \(String(describing: self.name8))" +
            "\n  name9: \(String(describing: self.name9))" +
            "\n  name10: \(String(describing: self.name10))" +
            "\n  phonetic1: \(String(describing: self.phonetic1))" +
            "\n  phonetic2: \(String(describing: self.phonetic2))" +
            "\n  phonetic3: \(String(describing: self.phonetic3))" +
            "\n  phonetic4: \(String(describing: self.phonetic4))" +
            "\n  phonetic5: \(String(describing: self.phonetic5))" +
            "\n  phonetic6: \(String(describing: self.phonetic6))" +
            "\n  phonetic7: \(String(describing: self.phonetic7))" +
            "\n  phonetic8: \(String(describing: self.phonetic8))" +
            "\n  phonetic9: \(String(describing: self.phonetic9))" +
            "\n  phonetic10: \(String(describing: self.phonetic10))" +
            "\n  description1: \(String(describing: self.description1))" +
            "\n  description2: \(String(describing: self.description2))" +
            "\n  description3: \(String(describing: self.description3))" +
            "\n  description4: \(String(describing: self.description4))" +
            "\n  description5: \(String(describing: self.description5))" +
            "\n  description6: \(String(describing: self.description6))" +
            "\n  description7: \(String(describing: self.description7))" +
            "\n  description8: \(String(describing: self.description8))" +
            "\n  description9: \(String(describing: self.description9))" +
            "\n  description10: \(String(describing: self.description10))" +
            "\n  categoryID: \(String(describing: self.categoryID))" +
            "\n  favorite: \(String(describing: self.favorite))")
    }
}
