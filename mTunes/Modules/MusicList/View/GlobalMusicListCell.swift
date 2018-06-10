//
//  GlobalMusicListCell.swift
//  mTunes
//
//  Created by Mergaliev Ibragim on 10/06/2018.
//  Copyright © 2018 Mergaliev Ibragim. All rights reserved.
//
import UIKit
import Foundation

class GlobalMusicListCell: UITableViewCell{

    @IBOutlet weak var author: UILabel!
    
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var addButton: UIButton!
    
    var model: Music?{
        didSet{
            self.name.text = model?.name
            self.author.text = model?.author
            
        }
    }
    
}
