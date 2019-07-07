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
    
    /// function to get the user's preferred  language in UserDefault.
    ///
    /// - Returns: String for the filename of Strig.resource of the language. If there is not value, returns nil.
    func getPreferredLanguage() -> String? {
        let userDefaults = UserDefaults.standard
        return userDefaults.string(forKey: self.key_preferredLanguage)
    }
    
    /// function to get the display order of the languages.
    ///
    /// - Returns: String Array containing the file names of String.resource of those languages. Languages or the language whose display flag is false is automatically removed. If there is no value, returns nil.
    func getLanguageDisplayOrder() -> [String]? {
        guard let order = UserDefaults.standard.stringArray(forKey: self.key_languageDisplayOrder) else {return nil}
        
        return order.filter() {str in
            guard let displayFlag = self.getLanguageDisplayFlag() else {return false}
            return displayFlag[str] ?? false
        }
    }
    
    ///function to gt the display flag for languages.
    ///
    /// - Returns: String and Bool Dictionary indicating whether to display the language of the Key or not. If there is no value, returns nil.
    func getLanguageDisplayFlag() -> [String: Bool]? {
        return UserDefaults.standard.dictionary(forKey: self.key_languageDisplayFlag) as? [String: Bool]
    }
    
    ///function to set the preferred language.
    func setPreferredLanguage(lang: Lang.Language) {
        UserDefaults.standard.set(lang.rawValue, forKey: self.key_preferredLanguage)
    }
    
    ///function to set the language display order.
    func setLanguageDisplayOrder(first: Lang.Language, second: Lang.Language, third: Lang.Language, fourth: Lang.Language) {
        UserDefaults.standard.set([first.rawValue, second.rawValue, third.rawValue, fourth.rawValue], forKey: self.key_languageDisplayOrder)
    }
    
    ///function to set the language display flag.
    func setLanguageDisplayFlag(en: Bool, jp: Bool, cn_s: Bool, cn_t: Bool) {
        UserDefaults.standard.set([Lang.Language.English.rawValue:en, Lang.Language.Japanese.rawValue:jp, Lang.Language.SimplifiedChinese.rawValue:cn_s,Lang.Language.TraditionalChinese.rawValue:cn_t], forKey: self.key_languageDisplayFlag)
    }
    
    ///function to set the English display flag.
    func setLanguageDisplayFlag(en: Bool) {
        
        let dic = self.getLanguageDisplayFlag()
        UserDefaults.standard.set([Lang.Language.English.rawValue:en, Lang.Language.Japanese.rawValue:dic?[Lang.Language.Japanese.rawValue] ?? true, Lang.Language.SimplifiedChinese.rawValue:dic?[Lang.Language.SimplifiedChinese.rawValue] ?? true, Lang.Language.TraditionalChinese.rawValue:dic?[Lang.Language.TraditionalChinese.rawValue] ?? true], forKey: self.key_languageDisplayFlag)
    }
    
    ///function to set the Japanese display flag.
    func setLanguageDisplayFlag(jp: Bool) {
        
        let dic = self.getLanguageDisplayFlag()
        UserDefaults.standard.set([Lang.Language.English.rawValue:dic?[Lang.Language.English.rawValue] ?? true, Lang.Language.Japanese.rawValue:jp, Lang.Language.SimplifiedChinese.rawValue:dic?[Lang.Language.SimplifiedChinese.rawValue] ?? true, Lang.Language.TraditionalChinese.rawValue:dic?[Lang.Language.TraditionalChinese.rawValue] ?? true], forKey: self.key_languageDisplayFlag)
    }
    
    ///function to set the Simplified Chinese display flag.
    func setLanguageDisplayFlag(cn_s: Bool) {
        
        let dic = self.getLanguageDisplayFlag()
        UserDefaults.standard.set([Lang.Language.English.rawValue:dic?[Lang.Language.English.rawValue] ?? true, Lang.Language.Japanese.rawValue:dic?[Lang.Language.Japanese.rawValue] ?? true, Lang.Language.SimplifiedChinese.rawValue:cn_s, Lang.Language.TraditionalChinese.rawValue:dic?[Lang.Language.TraditionalChinese.rawValue] ?? true], forKey: self.key_languageDisplayFlag)
    }
    
    ///function to set the Traditional Chinese display flag.
    func setLanguageDisplayFlag(cn_t: Bool) {
        
        let dic = self.getLanguageDisplayFlag()
        UserDefaults.standard.set([Lang.Language.English.rawValue:dic?[Lang.Language.English.rawValue] ?? true, Lang.Language.Japanese.rawValue:dic?[Lang.Language.Japanese.rawValue] ?? true, Lang.Language.SimplifiedChinese.rawValue:dic?[Lang.Language.SimplifiedChinese.rawValue] ?? true, Lang.Language.TraditionalChinese.rawValue:cn_t], forKey: self.key_languageDisplayFlag)
    }
}
