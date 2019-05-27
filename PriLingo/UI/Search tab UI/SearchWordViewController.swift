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
    
    var myWord: DSOWord?
    var titlePhrase: String?
    
    init(labelName: String?) {
        super.init(nibName: "SearchWordViewController", bundle: nil)
        self.titlePhrase = labelName
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
        self.myTItleAndButtonView.myTitleLabel.text = self.titlePhrase
        
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
