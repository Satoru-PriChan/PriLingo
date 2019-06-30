//
//  DisplayLanguageOrderViewController.swift
//  PriLingo
//
//  Created by USER on 2019/06/25.
//  Copyright © 2019 SoLaMi Smile. All rights reserved.
//

import UIKit

class DisplayLanguageOrderViewController: MyContentViewController, UITableViewDataSource, UITableViewDelegate {

    
    @IBOutlet weak var myTableView: UITableView!
    let identifier = "MyCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.myTableView.register(UINib.init(nibName: "SearchCateogryTableViewCell", bundle: nil), forCellReuseIdentifier: self.identifier)
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.identifier, for: indexPath) as? SearchCateogryTableViewCell
        cell?.theChapterLabel.isHidden = true
        
        cell?.setCell(chapterNo: "", categoryNameEN: self.getLanguageNameInPreferredLanguage(howManyth: indexPath.row), categoryNameJP: self.getLanguageNameInPreferredLanguage(howManyth: indexPath.row), categoryNameCN_S: self.getLanguageNameInPreferredLanguage(howManyth: indexPath.row), categoryNameCN_T: self.getLanguageNameInPreferredLanguage(howManyth: indexPath.row))
        
        return cell ?? SearchCateogryTableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    //Others
    
    func getLanguageNameInPreferredLanguage(howManyth: Int) -> String {
        switch howManyth {
        case 0:
            let settings = Settings.init()
            return Lang.getLocalizedString(key: "english", lang: Lang.Language.init(rawValue: settings.getPreferredLanguage() ?? Lang.Language.English.rawValue))
        case 1:
            let settings = Settings.init()
            return Lang.getLocalizedString(key: "japanese", lang: Lang.Language.init(rawValue: settings.getPreferredLanguage() ?? Lang.Language.English.rawValue))
        case 2:
            let settings = Settings.init()
            return Lang.getLocalizedString(key: "simplified_chinese", lang: Lang.Language.init(rawValue: settings.getPreferredLanguage() ?? Lang.Language.English.rawValue))
        default:
            let settings = Settings.init()
            return Lang.getLocalizedString(key: "traditional_chinese", lang: Lang.Language.init(rawValue: settings.getPreferredLanguage() ?? Lang.Language.English.rawValue))
        }
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
