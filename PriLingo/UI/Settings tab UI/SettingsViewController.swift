//
//  SettingsViewController.swift
//  PriLingo
//
//  Created by USER on 2019/03/20.
//  Copyright © 2019 SoLaMi Smile. All rights reserved.
//

import UIKit

class SettingsViewController: MyContentViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var myTableVIew: UITableView!
    
    let identifier = "MyCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //Navigation title
        if let myNav = self.navigationController as? MyUINavigationController {
            myNav.myNavigationbar?.myTitleImage.image = UIImage.init(named: "TitleSettings.png")
        }
        
        //Background image
        self.view.backgroundColor = UIColor.init(patternImage: UIImage.init(named: "BackGroundFlower.jpg")!)
        

        //tableview register
        self.myTableVIew.register(UINib.init(nibName: "SearchCateogryTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: self.identifier)
        
        //TableView separator line
        self.myTableVIew.separatorColor = UIColor.clear
    }
    
    //MARK: UITableViewDelegate
    
    ///function to return the number of cells
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    ///function to return the cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.identifier, for: indexPath) as? SearchCateogryTableViewCell
        
        switch indexPath.row {
        case 0:
            cell?.setCell(chapterNo: "", categoryNameEN: Lang.getLocalizedString(key: "preferred_language", lang: Lang.Language.English), categoryNameJP: Lang.getLocalizedString(key: "preferred_language", lang: Lang.Language.Japanese), categoryNameCN_S: Lang.getLocalizedString(key: "preferred_language", lang: Lang.Language.SimplifiedChinese), categoryNameCN_T: Lang.getLocalizedString(key: "preferred_language", lang: Lang.Language.TraditionalChinese))

        default:
            cell?.setCell(chapterNo: "", categoryNameEN: Lang.getLocalizedString(key: "Language Display Order", lang: Lang.Language.English), categoryNameJP: Lang.getLocalizedString(key: "Language Display Order", lang: Lang.Language.Japanese), categoryNameCN_S: Lang.getLocalizedString(key: "Language Display Order", lang: Lang.Language.SimplifiedChinese), categoryNameCN_T: Lang.getLocalizedString(key: "Language Display Order", lang: Lang.Language.TraditionalChinese))
        }
        
        //hide chapter label
        cell?.theChapterLabel.isHidden = true
        
        return cell ?? SearchCateogryTableViewCell()
    }
    
    //MARK: - Other functions
    
    func getLanguageNameInPreferredLanguage(howManyth: Int) -> String {
        switch howManyth {
        case 1:
            let settings = Settings.init()
            return Lang.getLocalizedString(key: "english", lang: Lang.Language.init(rawValue: settings.getPreferredLanguage() ?? Lang.Language.English.rawValue))
        case 2:
            let settings = Settings.init()
            return Lang.getLocalizedString(key: "japanese", lang: Lang.Language.init(rawValue: settings.getPreferredLanguage() ?? Lang.Language.English.rawValue))
        case 3:
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
