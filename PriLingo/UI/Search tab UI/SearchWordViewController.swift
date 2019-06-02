//
//  SearchWordViewController.swift
//  PriLingo
//
//  Created by USER on 2019/05/03.
//  Copyright © 2019 SoLaMi Smile. All rights reserved.
//

import UIKit

class SearchWordViewController: MyLoopScrollViewController, TitleAndButtonViewDelegate, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var myTItleAndButtonView: TitleAndButtonView!
    
    ///paging enabled on .xib.
    @IBOutlet weak var MyLoopScrollViewController: UIScrollView!

    ///title to display
    var titleJP: String?
    var titleEN: String?
    var titleCN_S: String?
    var titleCN_T: String?
    
    ///reuseIdentifier
    let myReuseIdentifier = "myCell"
    
    ///words to display.
    var dsoWords: [DSOWord]?
    
    ///Initializer
    init(_categoryID: String?, _titleJP: String?, _titleEN: String?, _titleCN_S: String?, _titleCN_T: String?) {
        
        //use DB
        let DAOwords = DAOMSTWords.init()
        var _dsoWords: [DSOWord]? = []
        if _categoryID != nil {
            _dsoWords = DAOwords.exeSelect(_categoryID: _categoryID!)
        }
        
        
        super.init(_nibName: "SearchWordViewController", _scrollView: UIScrollView(), _tableView1: UITableView(), _tableView2: UITableView(), _tableView3: UITableView(), _pagesInTotal: _dsoWords == nil ? 10 : _dsoWords!.count)
        
        //set title property
        self.titleJP = _titleJP
        self.titleEN = _titleEN
        self.titleCN_S = _titleCN_S
        self.titleCN_T = _titleCN_T
        
        //use DB
        guard _dsoWords != nil else {return}
        self.dsoWords = _dsoWords

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
        self.myTItleAndButtonView.myTitleLabel.text = self.titleEN
        
        //set delegate
        self.myTItleAndButtonView.delegate = self
        
        //set table view & scroll view
        if self.dsoWords != nil && self.dsoWords!.count > 0 {
            
            //calculate content size according to the number of table views, ultimately to the number of words to display.
            self.myScrollView!.contentSize = CGSize.init(width: UIScreen.main.bounds.size.width * CGFloat.init(Double(self.dsoWords!.count)), height: self.myScrollView!.frame.size.height)
            
            for i in 0...(self.dsoWords!.count - 1) {
                //location of table view
                let tableView = UITableView.init(frame: CGRect.init(x: UIScreen.main.bounds.size.width * CGFloat(i), y: 0, width: UIScreen.main.bounds.size.width, height: self.myScrollView!.bounds.size.height))
                self.myScrollView!.addSubview(tableView)
                
                //tag
                guard self.dsoWords![i].iD != nil else {continue}
                tableView.tag = Int(self.dsoWords![i].iD!)!
                
                //register
                tableView.register(UINib.init(nibName: "SearchWordTableViewCell", bundle: nil), forCellReuseIdentifier: self.myReuseIdentifier)
                
                //delegate
                tableView.delegate = self
                
                //datasource
                tableView.dataSource = self
            }
        }
        
    }
    
    //MARK: - TitleAndButtonViewDelegate
    func titleAndButtonView(tappedRepeatButton: UIButton) {
        //debug
        print("File: \(#file) Line \(#line): Func \(#function):  function called. \n")
    }

    //UITableViewDelegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4//JP, EN, CN_S, CN_T
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.myReuseIdentifier, for: indexPath) as? SearchWordTableViewCell
        
        //judge which UITableView
        let newWord = self.dsoWords!.filter {Int($0.iD!)! == tableView.tag}
        
        guard newWord.count > 0 else {return cell ?? SearchWordTableViewCell()}
        
        //judge at how manyth cell
        var _word: String? = ""
        var _pronounce: String? = ""
        switch indexPath.row {
        case 0:
            _word = newWord[0].name1
            _pronounce = newWord[0].phonetic1
        case 1:
            _word = newWord[0].name2
            _pronounce = newWord[0].phonetic2
        case 2:
            _word = newWord[0].name3
            _pronounce = newWord[0].phonetic3
        case 3:
            _word = newWord[0].name4
            _pronounce = newWord[0].phonetic4
        default:
            break
        }
        cell?.setCell(word: _word, pronounce: _pronounce)
        
        return cell ?? SearchWordTableViewCell()
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
