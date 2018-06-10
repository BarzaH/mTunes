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
    
    
    func getMyMusicList(filtering: String) {
        musicAPIManager?.sendMyMusicListRequest(completion: { [weak self] (result) in
            
            let rawMusicList = result.components(separatedBy: "\n")
            self?.output.processMyMusicData(rawMyMusicList: rawMusicList)
        })
    }
    
    func getGlobalMusicList(filtering: String) {
        musicAPIManager?.sendMusicListRequest(completion: { [weak self] (result) in
            
            let rawMusicList = result.components(separatedBy: "\n")
            
            
            let filteredData = filtering.isEmpty ? rawMusicList : rawMusicList.filter({(dataString: String) -> Bool in
                return dataString.range(of: filtering, options: .caseInsensitive) != nil
            })
            
            self?.output.processGlobalMusicData(rawGlobalMusicList: filteredData)
        })
    }
}
