//
//  PreferredLanguageViewController.swift
//  PriLingo
//
//  Created by USER on 2019/06/25.
//  Copyright © 2019 SoLaMi Smile. All rights reserved.
//

import UIKit

class PreferredLanguageViewController: MyContentViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var myTableView: UITableView!
    
    let identifier = "MyCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.myTableView.register(UITableViewCell.self, forCellReuseIdentifier: self.identifier)
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        //update UI
        let setting = Settings.init()
        guard let preferredLanguage = setting.getPreferredLanguage() else {return}
        
        switch preferredLanguage {
        case Lang.Language.English.rawValue:
            self.doThingsWithIndexPath(indexPath: 0, tableView: self.myTableView)
        case Lang.Language.Japanese.rawValue:
            self.doThingsWithIndexPath(indexPath: 1, tableView: self.myTableView)
        case Lang.Language.SimplifiedChinese.rawValue:
            self.doThingsWithIndexPath(indexPath: 2, tableView: self.myTableView)
        default:
            self.doThingsWithIndexPath(indexPath: 3, tableView: self.myTableView)
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.identifier, for: indexPath)
        
        cell.isSelected = false

        cell.textLabel?.textColor = UIColor.white
        cell.backgroundColor = UIColor.init(red: 255/255, green: 203/255, blue: 226/255, alpha: 1.0)
        cell.layer.cornerRadius = 20
        cell.layer.masksToBounds = true
        cell.layer.borderColor = UIColor.white.cgColor
        cell.layer.borderWidth = 5
        
        cell.textLabel?.text = self.getLanguageNameInPreferredLanguage(howManyth: indexPath.row)
        
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    ///function called when a cell is touched. If it is selected programmatically, this method is not called.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.doThingsWithIndexPath(indexPath: indexPath.row, tableView: tableView)
    }
    
    //Others
    
    ///function for when a cell is tapped, including programatical selection.
    func doThingsWithIndexPath(indexPath: Int, tableView: UITableView) {
    
        //update settings
        let settings = Settings.init()
        switch indexPath {
        case 0:
            settings.setPreferredLanguage(lang: .English)
        case 1:
            settings.setPreferredLanguage(lang: .Japanese)
        case 2:
            settings.setPreferredLanguage(lang: .SimplifiedChinese)
        default:
            settings.setPreferredLanguage(lang: .TraditionalChinese)
        }
        
        //update table
        self.myTableView.reloadData()
        
        //update UI
        for i in 0...(Lang.Language.allCases.count - 1) {
            
            if i == indexPath {
                tableView.selectRow(at: IndexPath.init(row: i, section: 0), animated: false, scrollPosition: .top)
                let cell = tableView.cellForRow(at: IndexPath.init(row: i, section: 0))
                cell?.accessoryType = .checkmark
            } else {
                tableView.deselectRow(at: IndexPath.init(row: i, section: 0), animated: false)
                let cell = tableView.cellForRow(at: IndexPath.init(row: i, section: 0))
                cell?.accessoryType = .none
            }
        }
    }
    
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
