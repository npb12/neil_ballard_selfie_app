//
//  PyramidCollectionViewController.swift
//  neil_ballard_selfie_app
//
//  Created by Neil Ballard on 7/20/15.
//  Copyright (c) 2015 Neil_appworld. All rights reserved.
//

import UIKit

let reuseIdentifier = "groupCell"

class PyramidCollectionViewController: UICollectionViewController {
    
    @IBOutlet var collection_view: UICollectionView!
    
    
    var api_results:[JSON]?
    
    
    
    func fetchSelfies()
    {
        
        
        let urlPath = "https://api.instagram.com/v1/tags/selfie/media/recent?access_token=348510262.dfa6de0.0a47bd35571c4fb0b08ce54754edefbe"
        
        request(.GET, urlPath).responseJSON { (request, response, json, error) in
            if(json != nil){
                var json_object = JSON(json!)
                if let data = json_object["data"].arrayValue as [JSON]? {
                    self.api_results = data
                    self.collection_view.reloadData()
                }
            }
            
            
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchSelfies()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
       // self.collectionView!.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        //#warning Incomplete method implementation -- Return the number of sections
        
        return 1
    }
    
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //#warning Incomplete method implementation -- Return the number of items in the section
        return self.api_results?.count ?? 0
    }
    
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! PyramidCollectionViewCell

        cell.selfie = self.api_results?[indexPath.row]
        return cell
    }
    
    
    // MARK: UICollectionViewDelegate
    

    
    
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    

    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsZero
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0
    }
    
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        
        
        return 0
    }
    
    /*
    
*/
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        var totalHeight: CGFloat = (self.view.frame.height / 2.00)
        var totalWidth: CGFloat = (self.view.frame.width / 2.00)
        
        /*if(indexPath.row  % 2 == 1){
            var totalHeight: CGFloat = (self.view.frame.width / 2.00)
            var totalWidth: CGFloat = (self.view.frame.width / 2.00)
        }
        else if(indexPath.row % 2 == 0 && indexPath.row != 0){
            var totalHeight: CGFloat = (self.view.frame.width / 3.00)
            var totalWidth: CGFloat = (self.view.frame.width / 3.00)

        }*/
        

        
        
        return CGSizeMake(totalWidth, totalHeight)
    }

}
