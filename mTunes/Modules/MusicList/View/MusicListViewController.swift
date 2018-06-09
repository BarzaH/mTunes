//
//  MusicListMusicListViewController.swift
//  mTunes
//
//  Created by Mergaliev Ibragim on 08/06/2018.
//  Copyright © 2018 InnoUniv. All rights reserved.
//

import UIKit

class MusicListViewController: UIViewController, MusicListViewInput {

    var output: MusicListViewOutput!
    var appAssembly: ApplicationAssembly?
    
//    public init(output: MusicListViewOutput){
//        super.init(nibName: nil, bundle: nil)
//        self.output = output
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }


    // MARK: MusicListViewInput
    func setupInitialState() {
    }
}
