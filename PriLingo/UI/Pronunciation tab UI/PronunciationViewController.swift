//
//  PronunciationViewController.swift
//  PriLingo
//
//  Created by USER on 2019/03/20.
//  Copyright © 2019 SoLaMi Smile. All rights reserved.
//

import UIKit

//contents displayed on Pronunciation Table View.
struct PronunciationContent {
    let langKey: String
    let urlJa: URL
    let urlEn: URL
    let urlCnS: URL
    let urlCnT: URL
    
    public static func get() -> [PronunciationContent] {
        return [PronunciationContent(langKey: "japanese",
                                     urlJa: URL(string: "https://ja.wikipedia.org/wiki/日本語の音韻".addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!)!,
                                     urlEn: URL(string: "https://en.wikipedia.org/wiki/Japanese_phonology")!,
                                     urlCnS: URL(string: "https://zh.wikipedia.org/wiki/日語音系".addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!)!,
                                     urlCnT: URL(string: "https://zh.wikipedia.org/wiki/日語音系".addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!)!),
                
                PronunciationContent(langKey: "english",
                                     urlJa: URL(string: "https://ja.wikipedia.org/wiki/英語".addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!)!,
                                     urlEn: URL(string: "https://en.wikipedia.org/wiki/English_phonology")!,
                                     urlCnS: URL(string: "https://zh.wikipedia.org/wiki/英語音系學".addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!)!,
                                     urlCnT: URL(string: "https://zh.wikipedia.org/wiki/英語音系學".addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!)!),
                
                PronunciationContent(langKey: "chinese",
                                     urlJa: URL(string: "https://ja.wikipedia.org/wiki/ピン音".addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!)!,
                                     urlEn: URL(string: "https://en.wikipedia.org/wiki/Standard_Chinese_phonology")!,
                                     urlCnS: URL(string: "https://zh.wikipedia.org/wiki/現代標準漢語音系".addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!)!,
                                     urlCnT: URL(string: "https://zh.wikipedia.org/wiki/現代標準漢語音系".addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!)!)
        ]
    }
    
}

class PronunciationViewController: MyContentViewController {

    @IBOutlet weak var myTableView: UITableView!
    
    let identifier = "myCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //Navigation title
        if let myNav = self.navigationController as? MyUINavigationController {
            myNav.myNavigationbar?.myTitleImage.image = UIImage.init(named: "TitlePronunciation.png")
        }
        
        //tableview
        self.myTableView.register(UINib.init(nibName: "SearchCateogryTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: self.identifier)
        self.myTableView.backgroundColor = .clear
        self.myTableView.separatorColor = .clear
        
        
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

// MARK: - UITableViewDelegate

extension PronunciationViewController: UITableViewDelegate {
    
}

// MARK: - UITableViewDatasource

extension PronunciationViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PronunciationContent.get().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: self.identifier, for: indexPath) as? SearchCateogryTableViewCell else {return SearchCateogryTableViewCell()}
        
        let contents = PronunciationContent.get()[indexPath.row]
        
        cell.setCell(chapterNo: "",
                     categoryNameEN: Lang.getLocalizedString(key: contents.langKey, lang: .English),
                     categoryNameJP: Lang.getLocalizedString(key: contents.langKey, lang: .Japanese),
                     categoryNameCN_S: Lang.getLocalizedString(key: contents.langKey, lang: .SimplifiedChinese),
                     categoryNameCN_T: Lang.getLocalizedString(key: contents.langKey, lang: .TraditionalChinese))
        cell.selectionStyle = .none
        cell.theChapterLabel.isHidden  = true
        return cell
    }
    
    
}
