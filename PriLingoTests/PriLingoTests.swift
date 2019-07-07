//
//  PriLingoTests.swift
//  PriLingoTests
//
//  Created by USER on 2019/2/5.
//  Copyright © 2019年 SoLaMi Smile. All rights reserved.
//

import XCTest
import FMDB
@testable import PriLingo

class PriLingoTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    ///function to test DBSetUp class.
    func testDBInitialSetUp() {
        if !FileManager.default.fileExists(atPath: Path.libDB) {
            //perform initial copy
            let dbSetup = DBSetUp.init()
            XCTAssertTrue(dbSetup.InitialSetUpDB() && FileManager.default.fileExists(atPath: Path.libDB))
        } else {
            //not perform copy
            let dbSetUp = DBSetUp.init()
            XCTAssertFalse(dbSetUp.InitialSetUpDB())
        }
    }
    
    ///function to test SQL statement
    func testDBStatements() {
        //category
        let daoTCategories = DAOTCategories.init()
        let resultA = daoTCategories.exeSelect()
        XCTAssertNotNil(resultA, "resultA is null.")
        
        guard resultA != nil && resultA!.count != 0 else {return}
        
        for category in resultA! {
            category.describe()
            
            //words
            let daoMSTWords = DAOMSTWords.init()
            let resultB = daoMSTWords.exeSelect(_categoryID: category.iD!)
            XCTAssertNotNil(resultB, "resultB is nil at \(category.iD ?? "?")th trial.")
            
            if resultB == nil || resultB!.count == 0 {continue}
            for word in resultB! {
                word.describe()
            }
        }
    }
    
    ///function to test UPDATE function for MST_WORDS.
    /*
    func testDBUpdateMSTWORDS() {
        let dao = DAOMSTWords.init()
        
        //initial select
        let word0 = dao.exeSelect(_wordID: "1")
        print("File: \(#file) Line \(#line): Func \(#function): word0.favorite: \(String(describing: word0?.favorite))\n")
        
        //parameter: True -> False
        let word = dao.exeUpdate(_wordID: "1", thisWordIsFavorite: true)
        XCTAssertTrue(dao.convertStringIntoBool(_string: word?.favorite), "File: \(#file) Line \(#line): Func \(#function): First try failed. word?.favorite: \(String(describing: word?.favorite))\n")
        
        let word2 = dao.exeUpdate(_wordID: "1", thisWordIsFavorite: false)
        XCTAssertFalse(dao.convertStringIntoBool(_string: word2?.favorite), "File: \(#file) Line \(#line): Func \(#function): Second try failed. word2?.favorite: \(String(describing: word2?.favorite))\n")
        
        //parameter: True -> nil
        let word3 = dao.exeUpdate(_wordID: "1", thisWordIsFavorite: true)
        XCTAssertTrue(dao.convertStringIntoBool(_string: word3?.favorite), "File: \(#file) Line \(#line): Func \(#function): Third try failed. word3?.favorite: \(String(describing: word3?.favorite))\n")
        
        let word4 = dao.exeUpdate(_wordID: "1", thisWordIsFavorite: nil)
        XCTAssertFalse(dao.convertStringIntoBool(_string: word4?.favorite), "File: \(#file) Line \(#line): Func \(#function): Fourth try failed. word4?.favorite: \(String(describing: word4?.favorite))\n")
        
 }*/
    
    ///function to test Lang class that selects appropriate words from string.resource files.
    func testLang() {
        let key = "welcome"
        XCTAssertEqual(Lang.getLocalizedString(key: key, lang: .English), "Welcome")
        XCTAssertEqual(Lang.getLocalizedString(key: key, lang: .Japanese), "ようこそ")
        XCTAssertEqual(Lang.getLocalizedString(key: key, lang: .SimplifiedChinese), "欢迎光临")
        XCTAssertEqual(Lang.getLocalizedString(key: key, lang: .TraditionalChinese), "歡迎光臨")
    }
    
    ///funciton to test UserDefaults settings. At the first time after initial launch, it will be failed.
    func testUserDefaultsSettings() {
        let settings = Settings.init()
        XCTAssertFalse(settings.settingsInitialSetup())
    }
    
    ///function to test Getter and Setter of Settings class.
    func testUserDefaultsSettingsPreferredLanguage() {
        let settings = Settings.init()
        
        //preferred language
        settings.setPreferredLanguage(lang: .TraditionalChinese)
        XCTAssertTrue(settings.getPreferredLanguage() == Lang.Language.TraditionalChinese.rawValue)
        
        settings.setPreferredLanguage(lang: .Japanese)
        XCTAssertTrue(settings.getPreferredLanguage() == Lang.Language.Japanese.rawValue)
        
        settings.setPreferredLanguage(lang: .SimplifiedChinese)
        XCTAssertTrue(settings.getPreferredLanguage() == Lang.Language.SimplifiedChinese.rawValue)
        
        settings.setPreferredLanguage(lang: .English)
        XCTAssertTrue(settings.getPreferredLanguage() == Lang.Language.English.rawValue)
    }
    
     ///function to test Getter and Setter of Settings class.
    func testUserDefaultsSettingsDisplayOrder() {
        let settings = Settings.init()
        
        settings.setLanguageDisplayOrder(first: .TraditionalChinese, second: .SimplifiedChinese, third: .English, fourth: .Japanese)
        XCTAssertTrue(settings.getLanguageDisplayOrder() == [Lang.Language.TraditionalChinese.rawValue, Lang.Language.SimplifiedChinese.rawValue, Lang.Language.English.rawValue, Lang.Language.Japanese.rawValue])
        
        settings.setLanguageDisplayOrder(first: .Japanese, second: .English, third: .SimplifiedChinese, fourth: .TraditionalChinese)
        XCTAssertTrue(settings.getLanguageDisplayOrder() == [Lang.Language.Japanese.rawValue, Lang.Language.English.rawValue, Lang.Language.SimplifiedChinese.rawValue, Lang.Language.TraditionalChinese.rawValue])
    }
    
    ///function to test Getter and Setter of Settings class.
    func testUserDafaultsSettingsDisplayFlag() {
        let settings = Settings.init()
        
        settings.setLanguageDisplayFlag(en: false, jp: false, cn_s: false, cn_t: false)
        XCTAssertTrue(settings.getLanguageDisplayFlag() == [Lang.Language.English.rawValue:false, Lang.Language.Japanese.rawValue:false, Lang.Language.SimplifiedChinese.rawValue:false, Lang.Language.TraditionalChinese.rawValue:false])
        
        settings.setLanguageDisplayFlag(en: true, jp: true, cn_s: true, cn_t: true)
        XCTAssertTrue(settings.getLanguageDisplayFlag() == [Lang.Language.English.rawValue:true, Lang.Language.Japanese.rawValue:true, Lang.Language.SimplifiedChinese.rawValue:true, Lang.Language.TraditionalChinese.rawValue:true])
    }
    
    ///function to test Path class NextSoundPath() method.
    func testPathNextSoundPath() {
        let setting = Settings.init()
        setting.setLanguageDisplayFlag(en: false, jp: false, cn_s: false, cn_t: false)
        
        var path = "0001_en"
        
        for i in 0...199 {
            
            print("\(i)th trial: ")
            
            if let a = Path.nextSoundPath(soundPath: path) {
                path = a
            } else {
                break;
            }
        }
    }
    
    ///function to test Settings class getLanguageDisplayOrder().
    func testSettingsGetLanguageDisplayOrder() {
        let setting = Settings.init()
        setting.setLanguageDisplayFlag(en: true, jp: true, cn_s: true, cn_t: true)
        
        XCTAssertEqual(setting.getLanguageDisplayOrder(), [Lang.Language.Japanese.rawValue,Lang.Language.English.rawValue, Lang.Language.SimplifiedChinese.rawValue, Lang.Language.TraditionalChinese.rawValue])

        setting.setLanguageDisplayFlag(en: false, jp: true, cn_s: true, cn_t: true)
        
        XCTAssertEqual(setting.getLanguageDisplayOrder(), [ Lang.Language.Japanese.rawValue, Lang.Language.SimplifiedChinese.rawValue, Lang.Language.TraditionalChinese.rawValue])
        
        setting.setLanguageDisplayFlag(en: true, jp: false, cn_s: true, cn_t: false)
        
        XCTAssertEqual(setting.getLanguageDisplayOrder(), [Lang.Language.English.rawValue, Lang.Language.SimplifiedChinese.rawValue])
        
        setting.setLanguageDisplayFlag(en: false, jp: false, cn_s: false, cn_t: true)
        
        XCTAssertEqual(setting.getLanguageDisplayOrder(), [Lang.Language.TraditionalChinese.rawValue])
        
        setting.setLanguageDisplayFlag(en: false, jp: false, cn_s: false, cn_t: false)
        
        XCTAssertEqual(setting.getLanguageDisplayOrder(), [])
        
        setting.setLanguageDisplayFlag(en: true, jp: true, cn_s: true, cn_t: true)
        
        XCTAssertEqual(setting.getLanguageDisplayOrder(), [Lang.Language.Japanese.rawValue,Lang.Language.English.rawValue,  Lang.Language.SimplifiedChinese.rawValue, Lang.Language.TraditionalChinese.rawValue])
        
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
