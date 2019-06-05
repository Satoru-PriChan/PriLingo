//
//  MyLoopScrollViewController.swift
//  PriLingo
//
//  Created by USER on 2019/06/01.
//  Copyright © 2019 SoLaMi Smile. All rights reserved.
//

import UIKit

///class with a scroll view controller to loop it's content.
class MyLoopScrollViewController: MyContentViewController, UIScrollViewDelegate {
    
    var myScrollView: UIScrollView?
    var myTableView1: UITableView?
    var myTableView2: UITableView?
    var myTableView3: UITableView?
    var myTableViews: [UITableView]? {
        didSet {
            if self.myTableViews!.count == 3 {
                //set tag number
                self.myTableViews![0].tag = -1
                self.myTableViews![1].tag = 0
                self.myTableViews![2].tag = 1
                
                //debug
                print("File: \(#file) Line \(#line): Func \(#function):  Tag numbers changed. \n")
            }
        }
    }
    
    var pagesInTotal: Int?
    var currentPage: Int? {
        didSet {
            self.myTableViews!.forEach {(tableView: UITableView) in
                tableView.reloadData()
            }
        }
    }
    
    //MARK: - Initiallizer
    
    ///The tag numbers are to be like this: myTableView1 -- -1, myTableView2 -- 0, myTableView3 -- 1.
    init(_nibName: String, _scrollView: UIScrollView?, _tableView1: UITableView, _tableView2: UITableView, _tableView3: UITableView, _pagesInTotal: Int) {
        super.init(nibName: _nibName, bundle: nil)
        
        //set UITableView
        self.myTableView1 = _tableView1
        self.myTableView2 = _tableView2
        self.myTableView3 = _tableView3
        self.myTableView1!.tag = -1
        self.myTableView2!.tag = 0
        self.myTableView3!.tag = 1
        self.myTableViews = []
        self.myTableViews?.append(self.myTableView1!)
        self.myTableViews?.append(self.myTableView2!)
        self.myTableViews?.append(self.myTableView3!)
        
        //set page number
        self.pagesInTotal = _pagesInTotal
        self.currentPage = 1
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - UIViewController lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
    }
    
    //MARK: - Other methods
    private func overwriteFrames() {
        let w = UIScreen.main.bounds.size.width
        let h = myScrollView!.bounds.size.height
        
        self.myTableViews!.enumerated().forEach {(index: Int, tableView: UITableView) in
            tableView.frame = CGRect.init(x: w * CGFloat(index), y: 0, width: w, height: h)
        }
    }
    
    //MARK: - UIScrollViewDelegate
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        //prohibit swiping at the current page 1, or max
        if self.currentPage == 1 && scrollView.contentOffset.x < UIScreen.main.bounds.size.width{
            scrollView.setContentOffset(CGPoint.init(x: UIScreen.main.bounds.size.width, y: 0), animated: false)
            return
        }
        
        if self.currentPage == self.pagesInTotal && scrollView.contentOffset.x > UIScreen.main.bounds.size.width {
            scrollView.setContentOffset(CGPoint.init(x: UIScreen.main.bounds.size.width, y: 0), animated: false)
            return
        }
        
        //get where the scroll view is on it's content.
        let offsetX = scrollView.contentOffset.x
        
        //which direction scroll view is going.
        let actualPosition = scrollView.panGestureRecognizer.translation(in: scrollView.superview)
        
        //scroll view is going to the third content(UITableView here).
        if  (offsetX > UIScreen.main.bounds.size.width * 1.5) {
            
            
            //put them in order
            let tmpTable = self.myTableViews!.remove(at: 0)
            self.myTableViews?.append(tmpTable)
            
            //set frames
            self.overwriteFrames()
            
            //adjust the view port
            scrollView.contentOffset.x -= UIScreen.main.bounds.width
            
            
            //add 1 to the current page
            if self.currentPage! < self.pagesInTotal! {
                self.currentPage! += 1
                
                //debug
                print("File: \(#file) Line \(#line): Func \(#function):  self.currentPage! ADDED: \(self.currentPage!) acctualPotistion: \(actualPosition), offSetX: \(offsetX)\n")
            }
        } else if (offsetX < UIScreen.main.bounds.size.width * 0.5) {
            //put the list in order
            let tmpTable = self.myTableViews?.removeLast()
            self.myTableViews?.insert(tmpTable!, at: 0)
            
            //set frames
            self.overwriteFrames()
            
            //adjust the view port
            scrollView.contentOffset.x += UIScreen.main.bounds.width
            
            //subtract 1 from the current page
            if self.currentPage! > 0 {
                self.currentPage! -= 1
                
                //debug
                print("File: \(#file) Line \(#line): Func \(#function):  self.currentPage! SUBTRACTED: \(self.currentPage!) acctualPotistion: \(actualPosition), offSetX: \(offsetX)\n")
            } else {
                //debug
                print("File: \(#file) Line \(#line): Func \(#function):  self.currentPage! NO CHANGED: \(self.currentPage!) acctualPotistion: \(actualPosition), offSetX: \(offsetX)\n")
            }
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
