//
//  MusicListMusicListInitializer.swift
//  mTunes
//
//  Created by Mergaliev Ibragim on 08/06/2018.
//  Copyright © 2018 InnoUniv. All rights reserved.
//

import UIKit

class MusicListModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var musiclistViewController: MusicListViewController!

    override func awakeFromNib() {

        let configurator = MusicListModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: musiclistViewController)
    }

}
