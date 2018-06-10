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

    var rawMyMusicList: [String]?
    var rawGlobalMusicList: [String]?
    
    func viewIsReady() {
       interactor.getMyMusicList(filtering: "")
    }
    
    func addToMyMusic(cell: GlobalMusicListCell){
        
        let author = (cell.model!.author)!
        let name = (cell.model!.name)!
        
        let stringReprecentationOfModel: String = "\(author)-\(name)"
        (self.rawMyMusicList)!.append(stringReprecentationOfModel)
        self.rawGlobalMusicList = self.rawGlobalMusicList?.filter({(s) in s != stringReprecentationOfModel})
        
        
        
        processMyMusicData(rawMyMusicList: self.rawMyMusicList)
        processGlobalMusicData(rawGlobalMusicList: self.rawGlobalMusicList)
    }
    
    func searchBarTextChanged(newText: String){
        interactor.getGlobalMusicList(filtering: newText)
        
        
        let filteredData = newText.isEmpty ? nil : rawMyMusicList?.filter({(dataString: String) -> Bool in
            return dataString.range(of: newText, options: .caseInsensitive) != nil
        })
        
        
        let rows: [Music]
        
        if let fd = filteredData{
            rows =  processRawMusicList(rawMusicList: fd)
        }
        else{
            rows = processRawMusicList(rawMusicList: self.rawMyMusicList)
        }
        
        view.updateState(myMusicRows: rows)
    }
    
    func processMyMusicData(rawMyMusicList: [String]?) {
        
        self.rawMyMusicList = rawMyMusicList
        
        let rows = processRawMusicList(rawMusicList: rawMyMusicList)
        
        view.updateState(myMusicRows: rows)
    }
    
    func processGlobalMusicData(rawGlobalMusicList: [String]?) {
        
        self.rawGlobalMusicList = rawGlobalMusicList
        
        let rows = processRawMusicList(rawMusicList: self.rawGlobalMusicList)
        
        view.updateState(globalMusicRows: rows)
    }
    
    func processRawMusicList(rawMusicList: [String]?) -> [Music] {
        var rows = [Music]()
        rawMusicList?.forEach{ (element) in
            var musicInfo = element.components(separatedBy: "-")
            rows.append(Music(name: musicInfo[1], author: musicInfo[0]))
        }
        return rows
    }
    
}
