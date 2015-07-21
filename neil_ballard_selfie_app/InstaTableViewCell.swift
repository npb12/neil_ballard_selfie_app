//
//  InstaTableViewCell.swift
//  neil_ballard_selfie_app
//
//  Created by Neil Ballard on 7/19/15.
//  Copyright (c) 2015 Neil_appworld. All rights reserved.
//

import UIKit

class InstaTableViewCell: UITableViewCell {
    
    @IBOutlet weak var userLabelView: UILabel!
    
    @IBOutlet weak var selfieImageView: UIImageView!
    
    @IBOutlet weak var selfieSmaller: UIImageView!
    
    @IBOutlet weak var selfieSmallest: UIImageView!
    
    var selfie:JSON?{
        didSet{
         self.setPhotos()
        }
    
    }
    
    func setPhotos(){
        self.userLabelView.text = self.selfie?["caption"]["text"].string
        let urlString = self.selfie?["images"]["standard_resolution"]["url"].string
        if let url = NSURL(string: urlString!){
            if let data = NSData(contentsOfURL: url){
                self.selfieImageView.image = UIImage(data: data)
                self.selfieSmaller.image = UIImage(data: data)
                self.selfieSmallest.image = UIImage(data: data)
            }
        }
        
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
