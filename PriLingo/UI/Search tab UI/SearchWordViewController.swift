//
//  SearchWordViewController.swift
//  PriLingo
//
//  Created by USER on 2019/05/03.
//  Copyright © 2019 SoLaMi Smile. All rights reserved.
//

import UIKit
import AVFoundation

class SearchWordViewController: MyLoopScrollViewController, TitleAndButtonViewDelegate, UITableViewDelegate, UITableViewDataSource, SearchWordHeaderDelegate, SearchWordTableViewCellDelegate, AVAudioPlayerDelegate {
    
    @IBOutlet weak var myTItleAndButtonView: TitleAndButtonView!
    @IBOutlet weak var mySearchWordHeader: SearchWordHeader!
    ///paging enabled on .xib.
    @IBOutlet weak var myLoopScrollView: UIScrollView!
    
    ///title to display
    var titleJP: String?
    var titleEN: String?
    var titleCN_S: String?
    var titleCN_T: String?
    
    //audio player
    var audioPlayer: AVAudioPlayer?
    
    ///the sound path the system played last time.
    var currentSoundPath: String?
    
    //sound's repeat state
    var myRepeatState: RepeatState = .None
    
    ///reuseIdentifier
    let myReuseIdentifier = "myCell"
    
    ///words to display.
    var dsoWords: [DSOWord]? {
        didSet {
            
        }
    }
    
    ///Initializer
    init(_categoryID: String?, _titleJP: String?, _titleEN: String?, _titleCN_S: String?, _titleCN_T: String?) {
        
        //use DB
        let DAOwords = DAOMSTWords.init()
        var _dsoWords: [DSOWord]? = []
        if _categoryID != nil {
            _dsoWords = DAOwords.exeSelect(_categoryID: _categoryID!)
        }
        
        super.init(_nibName: "SearchWordViewController", _scrollView: myLoopScrollView, _tableView1: UITableView(), _tableView2: UITableView(), _tableView3: UITableView(), _pagesInTotal: _dsoWords == nil ? 10 : _dsoWords!.count)
        
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
        //self.myloopscrollview is nil at initialization, so set it here to self.super instead.
        self.myScrollView = self.myLoopScrollView
        //set it's delegate
        self.myScrollView?.delegate = self
        
        //set it's initial page(2)
        self.myScrollView?.contentOffset.x = UIScreen.main.bounds.size.width
        
        //Background image
        self.view.backgroundColor = UIColor.init(patternImage: UIImage.init(named: "BackGroundFlower.jpg")!)
        
        //Navigation title
        self.navigationItem.titleView = UIImageView.init(image: UIImage.init(named: "TitleSearch.png"))
        
        //back arrow text(none)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.menuButton(self, action: #selector(popSelf), imageName: "BackArrow.png")
        
        //set title
        self.myTItleAndButtonView.myTitleLabel.text = self.titleEN
        
        //set table view & scroll view
        if self.dsoWords != nil && self.dsoWords!.count > 0 {
            
            //calculate content size according to the number of table views, ultimately to the number of words to display.
            self.myScrollView!.contentSize = CGSize.init(width: UIScreen.main.bounds.size.width * CGFloat.init(Double(self.dsoWords!.count)), height: self.myScrollView!.frame.size.height)
            self.myTableViews!.enumerated().forEach {(i: Int, tableView: UITableView) in
                //location of table view
                tableView.frame = CGRect.init(x: UIScreen.main.bounds.size.width * CGFloat(i), y: 0, width: UIScreen.main.bounds.size.width, height: self.myScrollView!.bounds.size.height)
                self.myScrollView!.addSubview(tableView)
                
                //register
                tableView.register(UINib.init(nibName: "SearchWordTableViewCell", bundle: nil), forCellReuseIdentifier: self.myReuseIdentifier)
                
                //delegate
                tableView.delegate = self
                
                //datasource
                tableView.dataSource = self
                
                //appearance
                tableView.backgroundColor = UIColor.clear
                
                //delete lines between cells
                tableView.separatorStyle = .none
            }
        }
        
        //set SearchWordHeader label
        self.setHeader(currentPage: self.currentPage ?? 1)
        
        //SearchWordHeader delegate
        self.mySearchWordHeader.delegate = self
        
    }
    
    //MARK: - TitleAndButtonViewDelegate
    func titleAndButtonView(tappedRepeatButton: UIButton, repeatState: RepeatState) {
        //debug
        print("File: \(#file) Line \(#line): Func \(#function):  function called. \n")
        
        self.myRepeatState = repeatState
    }
    
    //MARK: - Others
    
    func setHeader(currentPage: Int) {
        if let mySearchWordHeader = self.mySearchWordHeader, let numberLabel = mySearchWordHeader.numberLabel {
            numberLabel.text = String(currentPage) + "/" + String(self.pagesInTotal!)
        mySearchWordHeader.changeFavoriteButtonApperance(isFavorite: DAOSuper.convertStringIntoBool(_string: self.dsoWords![currentPage - 1].favorite))
        }
        
        
        
    }
    
    ///function called when current page value is changed.
    override func currentPageChanged(currentPage: Int, myLoopScrollVC: MyLoopScrollViewController) {
        self.setHeader(currentPage: currentPage)

    }
    
    //MARK: - UITableViewDelegate

    //UITableViewDelegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4//JP, EN, CN_S, CN_T
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.myReuseIdentifier, for: indexPath) as? SearchWordTableViewCell
        
        //judge which UITableView
        let newWord = self.dsoWords![self.currentPage! - 1]
        
        //judge at how manyth cell
        var _word: String? = ""
        var _pronounce: String? = ""
        switch indexPath.row {
        case 0:
            _word = newWord.name1
            _pronounce = newWord.phonetic1
        case 1:
            _word = newWord.name2
            _pronounce = newWord.phonetic2
        case 2:
            _word = newWord.name3
            _pronounce = newWord.phonetic3
        case 3:
            _word = newWord.name4
            _pronounce = newWord.phonetic4
        default:
            break
        }
        cell?.setCell(word: _word, pronounce: _pronounce, delegate: self, tag: indexPath.row, wordID: newWord.iD!)
        
        return cell ?? SearchWordTableViewCell()
    }
    
    // MARK: - SearchWordHeaderDelegate
    ///function called when favorite button is tapped.
    func searchWordHeaderDelegate(touchedFavoriteButton: UIButton, searchWordHeader: SearchWordHeader) {
        guard self.dsoWords != nil && self.dsoWords!.count > 0 && self.currentPage != nil && self.mySearchWordHeader != nil else {return}
        guard let index = self.dsoWords!.firstIndex(where: {(word) in
            return Int(word.iD!) == self.currentPage!}) else {return}
        
        let oldWord = self.dsoWords![index]
        
        let dao = DAOMSTWords.init()
        //change favorite flag for the old word.
        guard let newWord = dao.exeUpdate(_wordID: oldWord.iD!, thisWordIsFavorite: !DAOSuper.convertStringIntoBool(_string: oldWord.favorite)) else {return}
        self.dsoWords![index] = newWord
        
        //change button appearance.
        self.mySearchWordHeader.changeFavoriteButtonApperance(isFavorite: DAOSuper.convertStringIntoBool(_string: newWord.favorite))
    }
    
    // MARK: - SearchWordTableViewCellDelegate
    
    ///function called when the play button is tapped.
    func searchWordTableViewCell(tappedPlayButton: UIButton, cell: SearchWordTableViewCell) {
        
        ///use audioplayer to play.
        
        self.newAudioPlayer(soundPath: cell.soundPath)
        
    }
    
    //MARK: - AVAudioPlayerDelegate
    
    //function to make new audio player.
    func newAudioPlayer(soundPath: String) {
        ///use audioplayer to play.
        if let bundlePath = Bundle.main.path(forResource: soundPath, ofType: "mp3") {
            let url = URL.init(fileURLWithPath: bundlePath)
            do {
                try self.audioPlayer = AVAudioPlayer.init(contentsOf: url)
                self.audioPlayer?.delegate = self
                
                //record sound path
                self.currentSoundPath = soundPath
                
                print("File \(#file): Line \(#line): Func \(#function):  playing...: \(soundPath) ")
                self.audioPlayer?.play()
                
            } catch let error as NSError {
                print("File \(#file): Line \(#line): Func \(#function):  audioPlayer error: \(error.localizedDescription) ")
            }
        }
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        
        switch self.myRepeatState {
        case .None:
            print("File \(#file): Line \(#line): called: Func \(#function) at None")
            break
        case .RepeatOne:
            print("File \(#file): Line \(#line): called: Func \(#function) at RepeatOne ")
            
            guard let currentSoundPath = self.currentSoundPath, var nextPath = Path.nextSoundPath(soundPath: currentSoundPath) else {return}
            let currentNO = self.currentSoundPath!.split(separator: "_")
            var nextNo = nextPath.split(separator: "_")
            
            if currentNO[0] != nextNo[0] {
                nextPath = String.init(format: "%04d", (Int(String(currentNO[0]))!)) + "_" + String(nextNo[1])
            }
            self.newAudioPlayer(soundPath: nextPath)
        case .RepeatAll:
            print("File \(#file): Line \(#line): called: Func \(#function) at RepeatAll ")
            guard let currentSoundPath = self.currentSoundPath, let nextPath = Path.nextSoundPath(soundPath: currentSoundPath) else {return}
            self.newAudioPlayer(soundPath: nextPath)

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
