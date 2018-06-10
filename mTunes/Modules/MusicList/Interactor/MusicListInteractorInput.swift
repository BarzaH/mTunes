//
//  MusicListMusicListInteractorInput.swift
//  mTunes
//
//  Created by Mergaliev Ibragim on 08/06/2018.
//  Copyright © 2018 InnoUniv. All rights reserved.
//

import Foundation

protocol MusicListInteractorInput {
    func getMyMusicList(filtering: String)
    
    func getGlobalMusicList(filtering: String)
}
