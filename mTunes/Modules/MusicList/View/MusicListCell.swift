//
//  MusicListItem.swift
//  mTunes
//
//  Created by Mergaliev Ibragim on 09/06/2018.
//  Copyright © 2018 Mergaliev Ibragim. All rights reserved.
//
import UIKit
import Foundation

class MusicListCell: UITableViewCell{
    
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var author: UILabel!
    
    
    var model: Music?{
        didSet{
            self.name.text = model?.name
            self.author.text = model?.author
//            self.image = model?.image
        }
    }
    
    
}
