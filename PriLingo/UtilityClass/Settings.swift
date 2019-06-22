//
//  Settings.swift
//  PriLingo
//
//  Created by USER on 2019/06/22.
//  Copyright © 2019 SoLaMi Smile. All rights reserved.
//

import Foundation

///class for settings recorded in UserDefaults.
class Settings {
    
    //keys to handle values
    ///The key for a user's preferred language. The value is string type.
    let key_preferredLanguage: String = "key_preferredLanguage"
    
    ///The key for the order of displayed languages. The value is string array type.
    let key_languageDisplayOrder: String = "key_languageDisplayOrder"
    
    ///The key for the flag to decide whether a language should be displayed. The value is Dictionary [String: Bool] type.
    let key_languageDisplayFlag: String = "key_languageDisplayFlag"
    let key_japaneseDisplayFlag: String = "key_japaneseDisplayFlag"
    let key_englishDisplayFlag: String = "key_englishDisplayFlag"
    let key_simplifiedChineseDisplayFlag: String = "key_simplifiedChineseDisplayFlag"
    let key_traditionalChineseDisplayFlag: String = "key_traditionalChineseDisplayFlag"
    
    ///function to be performed the app is launched to setup settings in UserDefaults. If any initial setup has done, returns true.
    func settingsInitialSetup() -> Bool {
        let userDefaults = UserDefaults.standard
        var result: Bool = false
        
        //initial setup for the preferred language
        if userDefaults.string(forKey: self.key_preferredLanguage) == nil {
            userDefaults.set(Lang.Language.English.rawValue, forKey: self.key_preferredLanguage)
            result = true
        }
        
        //initial setup for the language order
        if userDefaults.stringArray(forKey: self.key_languageDisplayOrder) == nil {
            userDefaults.set([Lang.Language.Japanese.rawValue, Lang.Language.English.rawValue, Lang.Language.SimplifiedChinese.rawValue, Lang.Language.TraditionalChinese.rawValue], forKey: self.key_languageDisplayOrder)
            result = true
        }
        
        //initial setup for the language display
        if userDefaults.dictionary(forKey: self.key_languageDisplayFlag) == nil {
            userDefaults.set([Lang.Language.English.rawValue:true, Lang.Language.Japanese.rawValue:true, Lang.Language.SimplifiedChinese.rawValue:true, Lang.Language.TraditionalChinese.rawValue:true], forKey: self.key_languageDisplayFlag)
            result = true
        }
        
        return result
    }
}
