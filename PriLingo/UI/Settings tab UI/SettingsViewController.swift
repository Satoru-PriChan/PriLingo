//
//  SettingsViewController.swift
//  PriLingo
//
//  Created by USER on 2019/03/20.
//  Copyright © 2019 SoLaMi Smile. All rights reserved.
//

import UIKit

class SettingsViewController: MyContentViewController, UITableViewDelegate, UITableViewDataSource, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var PreferredLanguageLabel: UILabel!
    @IBOutlet weak var myPickerView: UIPickerView!
    @IBOutlet weak var DisplayOrderLabel: UILabel!
    @IBOutlet weak var myTableView: UITableView!
    
    let identifier = "MyCell"
    
    ///function called everytime the view is displayed.
    override func viewWillAppear(_ animated: Bool) {
        //update table view
        self.myTableView.reloadData()
        
        //update picker view
        self.myPickerView.reloadAllComponents()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //Navigation title
        if let myNav = self.navigationController as? MyUINavigationController {
            myNav.myNavigationbar?.myTitleImage.image = UIImage.init(named: "TitleSettings.png")
        }
        
        //Background image
        self.view.backgroundColor = UIColor.init(patternImage: UIImage.init(named: "BackGroundFlower.jpg")!)
        
        //table view register
        myTableView.register(UINib.init(nibName: "SearchCateogryTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: self.identifier)
        
    }
    
    //MARK: UITableViewDelegate
    
    ///function to return the number of cells
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    ///function to return the cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.identifier, for: indexPath) as? SearchCateogryTableViewCell
        cell?.theChapterLabel.isHidden = true
        cell?.theCategoryLabel.text = self.getLanguageNameInPreferredLanguage(howManyth: indexPath.row)
        return cell ?? SearchCateogryTableViewCell()
    }
    
    //MARK: - UIPickerViewDatasource
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 4//Jp, En, Cn_S, Cn_T
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //MARK: - UIPickerViewDelegate
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.getLanguageNameInPreferredLanguage(howManyth: row)
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
