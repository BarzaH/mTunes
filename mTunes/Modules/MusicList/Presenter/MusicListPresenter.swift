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

    func viewIsReady() {

    }
}
