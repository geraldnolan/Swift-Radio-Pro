//
//  StationTableViewCell.swift
//  Swift Radio
//
//  Created by Matthew Fecher on 4/4/15.
//  Copyright (c) 2015 MatthewFecher.com. All rights reserved.
//

import UIKit
import SDWebImage

class SongRequestsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var stationNameLabel: UILabel!
    @IBOutlet weak var stationDescLabel: UILabel!
    @IBOutlet weak var stationImageView: UIImageView!
    
    var downloadTask: URLSessionDownloadTask?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // set table selection color
        let selectedView = UIView(frame: CGRect.zero)
        selectedView.backgroundColor = UIColor(red: 78/255, green: 82/255, blue: 93/255, alpha: 0.6)
        selectedBackgroundView  = selectedView
    }
    
    func configureSongRequestCell(songRequest: Row) {
        
        // Configure the cell...
        stationNameLabel.text = songRequest.songArtist
        stationDescLabel.text = songRequest.songTitle
        
        let imageURL = songRequest.songArt as NSString
        
        if imageURL.contains("http") {
            
            /*if let url = URL(string: songRequest.songArt) {
                stationImageView.loadImageWithURL(url: url) { (image) in
                    // station image loaded
                }
            }*/
            stationImageView.sd_setImage(with: URL(string: songRequest.songArt))
            
        } else if imageURL != "" {
            stationImageView.image = UIImage(named: imageURL as String)
            
        } else {
            stationImageView.image = UIImage(named: "stationImage")
        }
        
        stationImageView.applyShadow()
    }
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        downloadTask?.cancel()
        downloadTask = nil
        stationNameLabel.text  = nil
        stationDescLabel.text  = nil
        stationImageView.image = nil
    }
}
