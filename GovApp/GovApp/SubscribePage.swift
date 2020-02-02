//
//  SubscribePage.swift
//  GovApp
//
//  Created by Madison Velasquez on 2/1/20.
//  Copyright © 2020 Madison Velasquez. All rights reserved.
//

import UIKit

class SubscribePage: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    let subArray = ["Traffic", "Weather", "Police"]
    var SearchArray = [String]()
    var searching = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        // Do any additional setup after loading the view.
    
    }
}




extension SubscribePage: UITableViewDataSource, UITableViewDelegate{
   
    
        func tableView(_ tableView: UITableView, numberOfRowsInSection section : Int) -> Int
    {
        if searching{
            return SearchArray.count
        }
        else{
             return subArray.count
        }
   
    }
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
            if searching{
                cell?.textLabel?.text = SearchArray[indexPath.row]
            }
            else
            {
               cell?.textLabel?.text = subArray[indexPath.row]
            }
        
        return cell!
    }
}
extension SubscribePage: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchtext: String)
    {
        SearchArray = subArray.filter({$0.prefix(searchtext.count) == searchtext})
        searching = true
        tableView.reloadData()
    

    func searchBarCancelButton(_ searchBar:UISearchBar)
    {
        searching = false
        searchBar.text = " "
        tableView.reloadData()
    }
}
}

