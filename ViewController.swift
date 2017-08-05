//
//  ViewController.swift
//  SearchBarDemo
//
//  Created by ispl Mac Mini on 7/31/17.
//  Copyright © 2017 infinium. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate {

    @IBOutlet var tblView: UITableView!
    @IBOutlet var searchView: UISearchBar!
    
    var searchActive : Bool = false
    var finalArr:NSMutableArray!
    var searchFinalArr:NSMutableArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        finalArr=["San Francisco","kkaj vella","okok xcc","hadwork","New York","San Jose","Chicago","Los Angeles","Austin","Seattle","San Francisco","kkaj vella","okok xcc","hadwork","New York","San Jose","Chicago","Los Angeles","Austin","Seattle"]
        
        searchFinalArr=NSMutableArray()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if(searchActive)
        {
            return searchFinalArr.count
        }
        else
        {
            return finalArr.count
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell=tableView.dequeueReusableCell(withIdentifier: "Cell")
        
        let txtName:UILabel=cell?.viewWithTag(1) as! UILabel
        
        if(searchActive) {
            txtName.text=searchFinalArr.object(at: indexPath.row) as? String
        }
        else
        {
            txtName.text=finalArr.object(at: indexPath.row) as? String
        }
        
        return cell!
    }

    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar)
    {
        searchActive = true;
    }
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar)
    {
        searchActive = false;
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar)
    {
        searchActive = false;
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar)
    {
        searchActive = false;
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String)
    {
        if (searchBar.text?.isEmpty)!{
            searchActive = false
            self.tblView.reloadData()
        } else {
            print(" search text %@ ",searchBar.text! as NSString)
            searchActive = true
            searchFinalArr.removeAllObjects()
            
            for index in 0..<finalArr.count
            {
                let currentString = finalArr.object(at: index) as! String
            
                if currentString.lowercased().range(of: searchText.lowercased()) != nil
                {
                    searchFinalArr.add(currentString)
                }
            }
            self.tblView.reloadData()
        }
    }
}

