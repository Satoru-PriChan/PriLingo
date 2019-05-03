//
//  Lang.swift
//  PriLingo
//
//  Created by USER on 2019/05/03.
//  Copyright © 2019 SoLaMi Smile. All rights reserved.
//

import Foundation

///Utility class to get an appropriate word or phrase according to the user's preference
class Lang {
    
    //MARK: - Enum: The names of string resource files
    
    //Raw values are names of the string resource files.
    enum Language: String {
        case English = "en"
        case Japanese = "ja"
        case SimplifiedChinese = "zh-Hans"
        case TraditionalChinese = "zh-Hant"
    }
    
    //MARK: - Function
    
    /// Function to get the appropriate word from string.resource files.
    ///
    /// - Parameters:
    ///   - key: String
    ///   - lang: Lang.language (enum) specify preferred language here
    /// - Returns: String value(never nil)
    static func getLocalizedString(key: String?, lang: Language?) -> String {
        guard key != nil && lang != nil else {
            print("File \(#file): Line \(#line): Func \(#function):  Key or lang is nil. key: \(String(describing: key)) lang: \(String(describing: lang))")
            return ""
            
        }
        
        let path = Bundle.main.path(forResource: lang!.rawValue, ofType: "lproj")
        let bundle = Bundle(path: path!)
        return bundle?.localizedString(forKey: key!, value: nil, table: nil) ?? ""
    }
}
