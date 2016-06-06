//
//  ViewController.swift
//  TestSearchBar
//
//  Created by Jose Roberto Abreu on 6/6/16.
//  Copyright © 2016 Media Revolution. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var dataStore:[String] = ["Test","Object","Things","Antoher","Testing","Checking","Object 2","Another computer","Functional Test","Unit Test","Convulational Network","Deep Learning","Another aspect"]
    
    var data:[String] = []
    
    @IBOutlet weak var tblThings: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.filterData()
    }
    
    func filterData(textToSearch:String = ""){
        let backData = textToSearch.isEmpty ? dataStore : dataStore.filter({$0.containsString(textToSearch)})
        self.data = backData
        self.tblThings.reloadData()
    }

}

extension ViewController : UISearchBarDelegate{
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        self.filterData(searchText)
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        searchBar.text = ""
        self.filterData()
        searchBar.resignFirstResponder()
    }
    
    func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
        searchBar.showsCancelButton = true
    }
    
    func searchBarTextDidEndEditing(searchBar: UISearchBar) {
        searchBar.showsCancelButton = false
    }
    
}

extension ViewController : UITableViewDataSource{
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cellBasic", forIndexPath: indexPath)
        
        let things = data[indexPath.row]
        cell.textLabel?.text = things
        
        return cell
    }
    
}
