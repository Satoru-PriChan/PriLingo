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
    static let libraryDir = FileManager.default.urls(for: FileManager.SearchPathDirectory.libraryDirectory, in: FileManager.SearchPathDomainMask.userDomainMask).first!.path
    
    ///sandbox: document directory: DB directory
    static let libDBDir = Path.libraryDir + "/" + "DB"
    
    ///sandbox: DB path
    static let libDB = Path.libDBDir + "/" + Path.dbName + ".db"
    
    
    ///Bundle: path for DB in Main Bundle
    static let dBInBundle = Bundle.main.path(forResource: Path.dbName, ofType: "db")!
    
}
