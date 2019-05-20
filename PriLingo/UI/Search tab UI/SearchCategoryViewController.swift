//
//  SearchCategoryViewController.swift
//  PriLingo
//
//  Created by USER on 2019/05/03.
//  Copyright © 2019 SoLaMi Smile. All rights reserved.
//

import UIKit

class SearchCategoryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var categories: [DSOCategory]? = []
    
    let reuseIdentifier = "MyCell"

    @IBOutlet weak var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //Get category data from DB.
        let daoTCategories = DAOTCategories.init()
        self.categories = daoTCategories.exeSelect()
        
        //Register cell
        self.myTableView.register(UINib.init(nibName: "SearchCateogryTableViewCell", bundle: nil), forCellReuseIdentifier: self.reuseIdentifier)
        self.myTableView.delegate = self
        self.myTableView.dataSource = self
        
        //Navigation title
        self.navigationItem.titleView = UIImageView.init(image: UIImage.init(named: "TitleSearch.png"))
        
        //Background image
        self.view.backgroundColor = UIColor.init(patternImage: UIImage.init(named: "BackGroundFlower.jpg")!)
        
        //TableView separator line
        self.myTableView.separatorColor = UIColor.clear
        
        //Adjust it's height to fit custom navigation bar.
        if #available(iOS 11.0, *) {
            additionalSafeAreaInsets.top = MyNavigationBar.myHeight - 44
        }
    }
    
    //MARK: - UITableViewDatasource

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard self.categories != nil else {return 0}
        
        return self.categories!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: self.reuseIdentifier, for: indexPath) as? SearchCateogryTableViewCell else {
            //debug
            print("File: \(#file) Line \(#line): Func \(#function):  fatal error:")
            return UITableViewCell()}
        cell.setCell(chapterNo: String(indexPath.row + 1), categoryNameEN: self.categories![indexPath.row].name1, categoryNameJP: self.categories![indexPath.row].name2, categoryNameCN_S: self.categories![indexPath.row].name3, categoryNameCN_T: self.categories![indexPath.row].name4)
        
        return cell 
    }
    
    //MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //you can force self.categories unwrapped cause if it did not exist it would never be tapped.
       
        //Screen transition
        self.navigationController?.pushViewController(SearchWordViewController.init(labelName: self.categories![indexPath.row].name1), animated: false)
        
        //Deselect the cell after selected
        tableView.deselectRow(at: indexPath, animated: false)
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
