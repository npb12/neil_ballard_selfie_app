//
//  PyramidCollectionViewCell.swift
//  neil_ballard_selfie_app
//
//  Created by Neil Ballard on 7/20/15.
//  Copyright (c) 2015 Neil_appworld. All rights reserved.
//

import UIKit

class PyramidCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var selfieImage: UIImageView!
    
    
    
    var selfie:JSON?{
        didSet{
            self.setPhotos()
        }
        
    }
    
    func setPhotos(){
        if let urlString = self.selfie?["images"]["standard_resolution"]["url"].string{
            if let url = NSURL(string: urlString){
        if let data = NSData(contentsOfURL: url){
            self.selfieImage.image = UIImage(data: data)
        }
            }
        }
    }
    
    
    
}
