//
//  DBSetUp.swift
//  PriLingo
//
//  Created by USER on 2019/03/08.
//  Copyright © 2019 SoLaMi Smile. All rights reserved.
//

import Foundation


/// class to perform initial setup of DB.
class DBSetUp {
    
    /// function to perform initial copy of DB file from Sandbox to Document Folder.
    ///
    /// - Returns: if copy performed, return true. else, return false
    func InitialSetUpDB() -> Bool{
        if !FileManager.default.fileExists(atPath: Path.libDB) {
            do {
                try FileManager.default.createDirectory(atPath: Path.libDBDir, withIntermediateDirectories: true, attributes: nil)
                
                try FileManager.default.copyItem(atPath: Path.dBInBundle, toPath: Path.libDB)
                return true
            } catch {
                //debug
                print("File: \(#file) Line \(#line): Func \(#function):  DB copy from Sandbox to Document Folder failed. Error: \(error)")
                return false
            }
            
        }
        return false
        
    }
}
