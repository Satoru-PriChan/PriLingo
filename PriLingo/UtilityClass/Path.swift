//
//  Path.swift
//  PriLingo
//
//  Created by USER on 2019/03/07.
//  Copyright © 2019 SoLaMi Smile. All rights reserved.
//

import Foundation

//class to provide pathes for various files or directories
class Path {
    
    //DB file name
    static let dbName = "PriLingoDB";
    
    ///sandbox: document directory
    static let documentDir = FileManager.default.urls(for: FileManager.SearchPathDirectory.documentDirectory, in: FileManager.SearchPathDomainMask.userDomainMask).first!.path
    
    ///sandbox: document directory: DB directory
    static let docDBDir = Path.documentDir + "/" + "DB"
    
    ///sandbox: DB path
    static let docDB = Path.docDBDir + "/" + Path.dbName + ".db"
    
    
    ///Bundle: path for DB in Main Bundle
    static let dBInBundle = Bundle.main.path(forResource: Path.dbName, ofType: "db")!
    
}
