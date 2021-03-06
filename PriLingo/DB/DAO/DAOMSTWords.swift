//
//  DAOMSTWords.swift
//  PriLingo
//
//  Created by USER on 2019/03/10.
//  Copyright © 2019 SoLaMi Smile. All rights reserved.
//


import Foundation
import FMDB

///class for DAO class to retrieve data from MST_WORDS
class DAOMSTWords: DAOSuper {
    
    /// function to perform SELECT * FROM MST_WORDS WHERE MST_WORDS_T_CATEGORIES_ID = ?
    ///
    /// - Parameter _categoryID: categoryID whose Words' data you would like to get
    /// - Returns: an Array of DSOWord. if some error occurred, it returns nil.
    func exeSelect(_categoryID: String) -> Array<DSOWord>?{
        let myDB = FMDatabase.init(path: Path.libDB)
        var myResultSet: FMResultSet? = nil
        var words: Array<DSOWord> = []
        
        myDB.open()
        
        do {
            myResultSet = try myDB.executeQuery(Statements.SELECT_ALL_MSTWORDS, values: [_categoryID])
        } catch {
            //debug
            print("File: \(#file) Line \(#line): Func \(#function):  Some error happened executing \(Statements.SELECT_ALL_MSTWORDS), categoryID = \(_categoryID)")
            return nil
        }
        
        //you can force myResultSet unwrapped cause it has already passed do-catch clause.
        while(myResultSet!.next()) {
            words.append(DSOWord.init(myResultSet: myResultSet!))
        }
        
        myDB.close()
        return words
    }
    
    /// function to perform SELECT * FROM MST_WORDS WHERE MST_WORDS_T_CATEGORIES_ID = ?
    ///
    /// - Parameter _categoryID: categoryID whose Words' data you would like to get
    /// - Returns: an Array of DSOWord. if some error occurred, it returns nil.
    func exeSelect(_wordID: String) -> DSOWord?{
        let myDB = FMDatabase.init(path: Path.libDB)
        var myResultSet: FMResultSet? = nil
        var word: DSOWord
        
        myDB.open()
        
        do {
            myResultSet = try myDB.executeQuery(Statements.SELECT_ONE_MSTWORDS, values: [_wordID])
        } catch {
            //debug
            print("File: \(#file) Line \(#line): Func \(#function):  Some error happened executing \(Statements.SELECT_ALL_MSTWORDS), categoryID = \(_wordID)")
            return nil
        }
        
        //you can force myResultSet unwrapped cause it has already passed do-catch clause.
        myResultSet!.next()
        word = DSOWord.init(myResultSet: myResultSet!)
        
        myDB.close()
        return word
    }
    
    ///function to get Favorited words.If some error happens, it returns nil.
    func exeSelectFavorite() -> [DSOWord]? {
        let myDB = FMDatabase.init(path: Path.libDB)
        var myResultSet: FMResultSet? = nil
        var words: Array<DSOWord> = []
        
        myDB.open()
        
        do {
            myResultSet = try myDB.executeQuery(Statements.SELECT_FAVORITE_MSTWORDS, values: nil)
        } catch {
            //debug
            print("File: \(#file) Line \(#line): Func \(#function):  Some error happened")
            return nil
        }
        
        //you can force myResultSet unwrapped cause it has already passed do-catch clause.
        while(myResultSet!.next()) {
            words.append(DSOWord.init(myResultSet: myResultSet!))
        }
        
        myDB.close()
        return words
    }
    
    /// Function to execute UPDATE statment to MST_WORDS.
    ///
    /// - Parameters:
    ///   - _wordID:
    ///   - thisWordIsFavorite: If this words is favorited one, set true. If not, set false. You can set nill. It is considered as false.
    /// - Returns: If success, returns updated DSOWord object. If failed, returns nil.
    func exeUpdate(_wordID: String?, thisWordIsFavorite: Bool?) -> DSOWord? {
        let myDB = FMDatabase.init(path: Path.libDB)
        
        myDB.open()
        myDB.executeUpdate(Statements.UPDATE_WORD_FAVORITE, withArgumentsIn: [DAOSuper.convertBoolIntoString(_bool: thisWordIsFavorite), _wordID ?? ""])
        myDB.close()
        
        return self.exeSelect(_wordID: _wordID ?? "")
    }
}
