//
//  FavoritesViewController.swift
//  PriLingo
//
//  Created by USER on 2019/03/20.
//  Copyright © 2019 SoLaMi Smile. All rights reserved.
//

import UIKit

class FavoritesViewController: SearchWordViewController {
    
    init() {
        super.init(_categoryID: nil, _titleJP: Lang.getLocalizedString(key: "favorite", lang: .Japanese), _titleEN: Lang.getLocalizedString(key: "favorite", lang: .English), _titleCN_S: Lang.getLocalizedString(key: "favorite", lang: .SimplifiedChinese), _titleCN_T: Lang.getLocalizedString(key: "favorite", lang: .TraditionalChinese))
        
        let dao = DAOMSTWords.init()
        self.dsoWords = dao.exeSelectFavorite()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //Navigation title
        if let myNav = self.navigationController as? MyUINavigationController {
            myNav.myNavigationbar?.myTitleImage.image = UIImage.init(named: "TitleFavorite.png")
        }
        
        //Background image
        self.view.backgroundColor = UIColor.init(patternImage: UIImage.init(named: "BackGroundFlower.jpg")!)
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
