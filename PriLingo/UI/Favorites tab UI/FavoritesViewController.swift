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
        
        if self.dsoWords == nil {
            self.pagesInTotal = 0
        } else {
            self.pagesInTotal = self.dsoWords!.count
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //update favorite words.
        let dao = DAOMSTWords.init()
        self.dsoWords = dao.exeSelectFavorite()
        
        if self.dsoWords == nil {
            self.pagesInTotal = 0
        } else {
            self.pagesInTotal = self.dsoWords!.count
        }
    
        //update currentPage property, for when totalPages property has changed from over 0 to 0, or oposite case.
        if self.currentPage == 0 && self.pagesInTotal != nil && self.pagesInTotal! > 0{
            self.currentPage = 1
        } else if (self.currentPage == nil || self.currentPage! > 0) && self.pagesInTotal == 0 {
            self.currentPage = 0
        }
        
        //update appearance
        self.setHeader(currentPage: self.currentPage ?? 0)
        
        self.myTableViews?.forEach {$0.reloadData()}
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
