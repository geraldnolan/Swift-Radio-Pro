//
//  StationCollectionViewCell.swift
//  SwiftRadioTV
//
//  Created by Care Value on 8/15/19.
//  Copyright © 2019 matthewfecher.com. All rights reserved.
//

import UIKit
import SDWebImage



class StationCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var stationNameLabel: UILabel!
    @IBOutlet weak var stationDescLabel: UILabel!
    @IBOutlet weak var stationImageView: UIImageView!
    
    func configureStationCell(station: RadioStation) {
        
        // Configure the cell...
        stationNameLabel.text = station.name
        stationDescLabel.text = station.desc
        
        let imageURL = station.imageURL as NSString
        
        if imageURL.contains("http") {
            
            /*if let url = URL(string: station.imageURL) {
                stationImageView.loadImageWithURL(url: url) { (image) in
                    // station image loaded
                }
                
            }*/
            stationImageView.sd_setImage(with: URL(string: imageURL as String))
            
        } else if imageURL != "" {
            stationImageView.image = UIImage(named: imageURL as String)
            
        } else {
            stationImageView.image = UIImage(named: "stationImage")
        }
        
        
        
        //stationImageView.applyShadow()
    }
    
    
    
}
