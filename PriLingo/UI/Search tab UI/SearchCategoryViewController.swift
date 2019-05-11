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
    }
    
    //MARK: - UITableViewDelegate

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard self.categories != nil else {return 0}
        
        return self.categories!.count
    }
    
    //MARK: - UITableViewDatasource
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: self.reuseIdentifier, for: indexPath) as? SearchCateogryTableViewCell else {
            //debug
            print("File: \(#file) Line \(#line): Func \(#function):  fatal error:")
            return UITableViewCell()}
        cell.setCell(chapterNo: String(indexPath.row + 1), categoryNameEN: self.categories![indexPath.row].name1, categoryNameJP: self.categories![indexPath.row].name2, categoryNameCN_S: self.categories![indexPath.row].name3, categoryNameCN_T: self.categories![indexPath.row].name4)
        
        return cell 
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
