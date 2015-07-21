//
//  InstaViewController.swift
//  neil_ballard_selfie_app
//
//  Created by Neil Ballard on 7/19/15.
//  Copyright (c) 2015 Neil_appworld. All rights reserved.
//

import UIKit

class InstaViewController: UIViewController, UITableViewDataSource{
    
        
    @IBOutlet weak var table_View: UITableView!
        
        
        
    var api_results:[JSON]?
    
    
    
    func fetchSelfies()
    {
        
        
        let urlPath = "https://api.instagram.com/v1/tags/selfie/media/recent?access_token=348510262.dfa6de0.0a47bd35571c4fb0b08ce54754edefbe"
        
        request(.GET, urlPath).responseJSON { (request, response, json, error) in
            if(json != nil){
                var json_object = JSON(json!)
                if let data = json_object["data"].arrayValue as [JSON]? {
                    self.api_results = data
                    self.table_View.reloadData()
                }
            }
            
            
        }
        
    }
    
    
    

        
        override func viewDidLoad() {
            
            
           fetchSelfies()
           
            
            
            super.viewDidLoad()
            
            
            
            
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
            var cell = tableView.dequeueReusableCellWithIdentifier("selfieCell") as! InstaTableViewCell
            cell.selfie = self.api_results?[indexPath.row]
            // cell.selfieImageView.image = self.results[indexPath.row]
          // cell.userLabelView.text = self.names[indexPath.row]
     //       cell.applyPlainShadow()
          //  return cell
            return cell
        }
        
        
        
        
}
