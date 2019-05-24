//
//  SearchWordViewController.swift
//  PriLingo
//
//  Created by USER on 2019/05/03.
//  Copyright © 2019 SoLaMi Smile. All rights reserved.
//

import UIKit

class SearchWordViewController: UIViewController {
    
    var myWord: DSOWord?
    var testPhrase: String?
    
    init(labelName: String?) {
        super.init(nibName: "SearchWordViewController", bundle: nil)
        self.testPhrase = labelName
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
