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
        
        //tableview register
        self.myTableVIew.register(UINib.init(nibName: "SearchCateogryTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: self.identifier)
        
        //Navigation title
        if let myNav = self.navigationController as? MyUINavigationController {
            myNav.myNavigationbar?.myTitleImage.image = UIImage.init(named: "TitleSettings.png")
        }
        //TableView separator line
        self.myTableVIew.separatorColor = UIColor.clear
    }
    
    ///function called after the view is appearred on the screen.
    override func viewDidAppear(_ animated: Bool) {
        self.myTableVIew.reloadData()
    }
    
    //MARK: UITableViewDelegate
    
    ///function to return the number of cells
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    ///function to return the cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.identifier, for: indexPath) as? SearchCateogryTableViewCell
        
        let setting = Settings.init()
        let preferredLanguage = setting.getPreferredLanguage()
        let lang = Lang.Language.init(rawValue: preferredLanguage ?? "en")
        
        switch indexPath.row {
        case 0:
            cell?.setCell(chapterNo: "", categoryNameEN: Lang.getLocalizedString(key: "preferred_language", lang: Lang.Language.English), categoryNameJP: Lang.getLocalizedString(key: "preferred_language", lang: Lang.Language.Japanese), categoryNameCN_S: Lang.getLocalizedString(key: "preferred_language", lang: Lang.Language.SimplifiedChinese), categoryNameCN_T: Lang.getLocalizedString(key: "preferred_language", lang: lang))

        default:
            cell?.setCell(chapterNo: "", categoryNameEN: Lang.getLocalizedString(key: "languages_to_display", lang: Lang.Language.English), categoryNameJP: Lang.getLocalizedString(key: "languages_to_display", lang: Lang.Language.Japanese), categoryNameCN_S: Lang.getLocalizedString(key: "languages_to_display", lang: Lang.Language.SimplifiedChinese), categoryNameCN_T: Lang.getLocalizedString(key: "languages_to_display", lang: lang))
        }
        
        //hide chapter label
        cell?.theChapterLabel.isHidden = true
        
        return cell ?? SearchCateogryTableViewCell()
    }
    
    ///function for when a cell is touched.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.row {
        case 0:
        self.navigationController?.pushViewController(PreferredLanguageViewController(), animated: false)
        default:
        self.navigationController?.pushViewController(DisplayLanguageOrderViewController(), animated: false)
        }
        
    }
    
    //MARK: - Other functions

    



    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
