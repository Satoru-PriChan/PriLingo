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
    
    /// function to get sound file's path. typically used in loop sound play.
    ///
    /// - Parameter soundPath: string. The format should be 4 digit number plus under bar plus an identifier for languages. like this 0001_ja
    /// - Returns: The sound path that should be played after parameter file's played.
    static func nextSoundPath(soundPath: String) -> String? {
        let elements = soundPath.split(separator: "_")
        var firstHalf = Int(String(elements[0]))!
        var secondHalf = String(elements[1])
        
        //debug
        print("File: \(#file) Line \(#line): called: Func \(#function)\n")
        
        //handle the first half
        if secondHalf == Lang.Language.TraditionalChinese.rawValue {
            //check if the number is over the number of all words.
            if Bundle.main.path(forResource: (String.init(format: "%04d", firstHalf) + "_" + Lang.Language.Japanese.rawValue), ofType: "mp3") == nil {
                //make it 1
                firstHalf = 1
            } else {
                firstHalf += 1
            }
        }
        
        //handle the second half
        let nextCase = Lang.Language(rawValue: secondHalf).nextCase()
        //debug
        print("File: \(#file) Line \(#line): Func \(#function): Before change: \(secondHalf), After change: \(nextCase.rawValue) \n")
        secondHalf = nextCase.rawValue

        
        return String.init(format: "%04d", firstHalf) + "_" + secondHalf
    }
    
}
