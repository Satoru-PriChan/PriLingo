//
//  ViewController.swift
//  PriLingo
//
//  Created by USER on 2019/2/5.
//  Copyright © 2019年 SoLaMi Smile. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let enProj = "en"
    let jaProj = "ja"
    let cnProj = "zh-Hans"
    let cnFantiProj = "zh-Hant"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        /*
        let path = Bundle.main.path(forResource: cnFantiProj, ofType: "lproj")
        let bundle = Bundle.init(path: path!)
        let str = bundle?.localizedString(forKey: "welcome", value: nil, table: nil)
        print("File: \(#file) Line \(#line): Func \(#function):  \n \n \n str: \(str ?? "error")")
 */
        
        //debug
        print("File: \(#file) Line \(#line): Func \(#function):  \n Path.docDB: \(Path.libDB) Path.dbINBundle: \n \(Path.dBInBundle)")
    }


}

