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
        self.myTableView.register(UITableViewCell.self, forCellReuseIdentifier: self.reuseIdentifier)
        
        //Navigation title
        self.navigationItem.titleView = UIImageView.init(image: UIImage.init(named: "TitleSearch.png"))
    }
    
    //MARK: - UITableViewDelegate

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard self.categories != nil else {return 0}
        
        return self.categories!.count
    }
    
    //MARK: - UITableViewDatasource
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: self.reuseIdentifier)
        if cell?.textLabel != nil {
                cell?.textLabel!.text = self.categories![indexPath.row].name1
        }
        
        return cell ?? UITableViewCell()
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
