//
//  MusicListMusicListPresenter.swift
//  mTunes
//
//  Created by Mergaliev Ibragim on 08/06/2018.
//  Copyright © 2018 InnoUniv. All rights reserved.
//

class MusicListPresenter: MusicListModuleInput, MusicListViewOutput, MusicListInteractorOutput {

    weak var view: MusicListViewInput!
    var interactor: MusicListInteractorInput!
    var router: MusicListRouterInput!

    var rawMusicList: [String]?
    
    func viewIsReady() {
       interactor.getMyMusicList()
        
    }
    
    func searchBarTextChanged(newText: String){
        let filteredData = newText.isEmpty ? nil : rawMusicList?.filter({(dataString: String) -> Bool in
            return dataString.range(of: newText, options: .caseInsensitive) != nil
        })
        
        if let fd = filteredData{
        processRawMusicList(rawMusicList: fd)
        }
        else{
            processRawMusicList(rawMusicList: self.rawMusicList)
        }
    }
    
    func processData(rawMusicListData: String?) {
        
        self.rawMusicList = rawMusicListData?.components(separatedBy: "\n")
        
        processRawMusicList(rawMusicList: rawMusicList)
    }
    
    func processRawMusicList(rawMusicList: [String]?){
        var rows = [Music]()
        rawMusicList?.forEach{ (element) in
            var musicInfo = element.components(separatedBy: "-")
            rows.append(Music(name: musicInfo[1], author: musicInfo[0]))
        }
        
        
        view.updateState(rows: rows)
    }
    
}
