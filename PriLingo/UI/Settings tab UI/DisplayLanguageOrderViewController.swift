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
        
        self.myTableView.register(UITableViewCell.self, forCellReuseIdentifier: self.identifier)
        
        // Do any additional setup after loading the view.
    }
    
    ///function called after the view is appeared.
    override func viewDidAppear(_ animated: Bool) {
        //update UI
        let settings = Settings.init()
        guard let dic = settings.getLanguageDisplayFlag() else {return}
        guard let cell0 = self.myTableView.cellForRow(at: IndexPath.init(row: 0, section: 0)) else {return}
        if dic[Lang.Language.English.rawValue]! {
            cell0.accessoryType = .checkmark
        } else {
            cell0.accessoryType = .none
        }
        
        guard let cell1 = self.myTableView.cellForRow(at: IndexPath.init(row: 1, section: 0)) else {return}
        if dic[Lang.Language.Japanese.rawValue]! {
            cell1.accessoryType = .checkmark
        } else {
            cell1.accessoryType = .none
        }
        
        guard let cell2 = self.myTableView.cellForRow(at: IndexPath.init(row: 2, section: 0)) else {return}
        if dic[Lang.Language.SimplifiedChinese.rawValue]! {
            cell2.accessoryType = .checkmark
        } else {
            cell2.accessoryType = .none
        }
        
        guard let cell3 = self.myTableView.cellForRow(at: IndexPath.init(row: 3, section: 0)) else {return}
        if dic[Lang.Language.TraditionalChinese.rawValue]! {
            cell3.accessoryType = .checkmark
        } else {
            cell3.accessoryType = .none
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
        
        //update UI and settings
        guard let cell = tableView.cellForRow(at: IndexPath.init(row: indexPath, section: 0)) else {return}
        let settings = Settings.init()
        
        if cell.accessoryType == .none {
            cell.accessoryType = .checkmark
            tableView.selectRow(at: IndexPath.init(row: indexPath, section: 0), animated: false, scrollPosition: .middle)
            switch indexPath {
            case 0:
                settings.setLanguageDisplayFlag(en: true)
            case 1:
                settings.setLanguageDisplayFlag(jp: true)
            case 2:
                settings.setLanguageDisplayFlag(cn_s: true)
            default:
                settings.setLanguageDisplayFlag(cn_t: true)
            }
        } else if cell.accessoryType == .checkmark {
            cell.accessoryType = .none
            tableView.deselectRow(at: IndexPath.init(row: indexPath, section: 0), animated: false)
            switch indexPath {
            case 0:
                settings.setLanguageDisplayFlag(en: false)
            case 1:
                settings.setLanguageDisplayFlag(jp: false)
            case 2:
                settings.setLanguageDisplayFlag(cn_s: false)
            default:
                settings.setLanguageDisplayFlag(cn_t: false)
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
