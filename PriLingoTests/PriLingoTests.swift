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
        if !FileManager.default.fileExists(atPath: Path.docDB) {
            //perform initial copy
            let dbSetup = DBSetUp.init()
            XCTAssert(dbSetup.InitialSetUpDB() && FileManager.default.fileExists(atPath: Path.docDB))
        } else {
            //not perform copy
            let dbSetUp = DBSetUp.init()
            XCTAssertFalse(dbSetUp.InitialSetUpDB())
        }
    }
    
    ///function to test SQL statement
    func testDBStatements() {
        let myDB = FMDatabase.init(path: Path.docDB)
        myDB.open()
        for i in 1...10 {
            do {
                let myResultSet = try myDB.executeQuery(Statements.SELECT_ALL_T_CATEGORIES, values: [i])
            } catch {
                XCTAssert(false)
            }
        }
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
