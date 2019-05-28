//
//  SearchWordViewController.swift
//  PriLingo
//
//  Created by USER on 2019/05/03.
//  Copyright © 2019 SoLaMi Smile. All rights reserved.
//

import UIKit

class SearchWordViewController: MyContentViewController, TitleAndButtonViewDelegate {
    
    @IBOutlet weak var myTItleAndButtonView: TitleAndButtonView!
    
    ///paging enabled on .xib.
    @IBOutlet weak var myScrollView: UIScrollView!

    ///title to display
    var titleJP: String?
    var titleEN: String?
    var titleCN_S: String?
    var titleCN_T: String?
    
    ///words to display.
    var dsoWords: [DSOWord]?
    
    ///Initializer
    init(_categoryID: String?, _titleJP: String?, _titleEN: String?, _titleCN_S: String?, _titleCN_T: String?) {
        
        super.init(nibName: "SearchWordViewController", bundle: nil)
        
        //set title property
        self.titleJP = _titleJP
        self.titleEN = _titleEN
        self.titleCN_S = _titleCN_S
        self.titleCN_T = _titleCN_T
        
        //use DB
        let DAOwords = DAOMSTWords.init()
        guard _categoryID != nil else {return}
        if let _dsoWords = DAOwords.exeSelect(_categoryID: _categoryID!) {
            self.dsoWords = _dsoWords
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //Background image
        self.view.backgroundColor = UIColor.init(patternImage: UIImage.init(named: "BackGroundFlower.jpg")!)
        
        //Navigation title
        self.navigationItem.titleView = UIImageView.init(image: UIImage.init(named: "TitleSearch.png"))
        
        //back arrow text(none)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.menuButton(self, action: #selector(popSelf), imageName: "BackArrow.png")
        
        //set title
        self.myTItleAndButtonView.myTitleLabel.text = self.titleJP
        
        //set delegate
        self.myTItleAndButtonView.delegate = self
        
    }
    
    //MARK: - TitleAndButtonViewDelegate
    func titleAndButtonView(tappedRepeatButton: UIButton) {
        //debug
        print("File: \(#file) Line \(#line): Func \(#function):  function called. \n")
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
