//
//  MusicListMusicListViewInput.swift
//  mTunes
//
//  Created by Mergaliev Ibragim on 08/06/2018.
//  Copyright © 2018 InnoUniv. All rights reserved.
//

protocol MusicListViewInput: class {

    /**
        @author Mergaliev Ibragim
        Setup initial state of the view
    */

    func updateState(myMusicRows: [Music])
    
    func updateState(globalMusicRows: [Music])
//    func setupInitialState()
}
