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
        guard key != nil else{
            print("File \(#file): Line \(#line): Func \(#function):  Key or lang is nil. key: \(String(describing: key)) ")
            return ""
        }
        
        //Default language is English
        let path = Bundle.main.path(forResource: lang?.rawValue ?? Lang.Language.English.rawValue, ofType: "lproj")
        
        let bundle = Bundle(path: path!)
        return bundle?.localizedString(forKey: key!, value: nil, table: nil) ?? ""
    }
    
    
    /// Function to get the appropriate word from given parameters.
    ///
    /// - Parameters:
    ///   - en: Option for English
    ///   - jp: Option for Japanese
    ///   - cn_s: Option for Simplified Chinese
    ///   - cn_t: Option for Traditional Chinese
    ///   - lang: Specific language
    /// - Returns: String appropriate for the lang parameter
    static func getLocalizedString(en: String?, jp: String?, cn_s: String?, cn_t: String?, lang: Language?) -> String {
        //Default language is English
        let l = lang ?? Language.English
        
        switch l {
        case .English:
            return en ?? ""
        case .Japanese:
            return jp ?? ""
        case .SimplifiedChinese:
            return cn_s ?? ""
        case .TraditionalChinese:
            return cn_t ?? ""
        }
    }
}
