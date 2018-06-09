//
//  MusicListMusicListInteractor.swift
//  mTunes
//
//  Created by Mergaliev Ibragim on 08/06/2018.
//  Copyright © 2018 InnoUniv. All rights reserved.
//

class MusicListInteractor: MusicListInteractorInput {

    weak var output: MusicListInteractorOutput!
    var musicAPIManager: MusicAPIManager?
    
    
    func getMyMusicList() {
        musicAPIManager?.sendMyMusicListRequest(completion: { [weak self] (result) in
            self?.output.processData(rawMusicListData: result)
        })
    }
    
}
