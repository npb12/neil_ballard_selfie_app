//
//  GroupViewController.swift
//  neil_ballard_selfie_app
//
//  Created by Neil Ballard on 7/20/15.
//  Copyright (c) 2015 Neil_appworld. All rights reserved.
//

import UIKit

class GroupViewController: UICollectionView, UICollectionViewDataSource, UICollectionViewDelegate{

    
    
    
    var api_results:[JSON]?
    
    
    
    func fetchSelfies()
    {
        
        
        let urlPath = "https://api.instagram.com/v1/tags/selfie/media/recent?access_token=348510262.dfa6de0.0a47bd35571c4fb0b08ce54754edefbe"
        
        request(.GET, urlPath).responseJSON { (request, response, json, error) in
            if(json != nil){
                var json_object = JSON(json!)
                if let data = json_object["data"].arrayValue as [JSON]? {
                    self.api_results = data
                    self.table_view.reloadData()
                }
            }
            
            
        }
        
    }
    
    
    
    
    
    override func viewDidLoad() {
        
        
        fetchSelfies()
        
        
        
        super.viewDidLoad()
        
        table_view.delegate = self
        
        
        // Do any additional setup after loading the view.
    }
    
    
    func selectRowAtIndexPath(indexPath: NSIndexPath!, animated: Bool, scrollPosition: UITableViewScrollPosition){
        
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return self.api_results?.count ?? 0
        
    }


    


    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        var cell = tableView.dequeueReusableCellWithIdentifier("groupCell") as! GroupTableViewCell
        if(indexPath.row  % 2 == 1){
            println("hello for 2")
        }
        else if(indexPath.row % 2 == 0){
            println("hello 3")
        }
        cell.selfie = self.api_results?[indexPath.row]
        return cell
    }

}
