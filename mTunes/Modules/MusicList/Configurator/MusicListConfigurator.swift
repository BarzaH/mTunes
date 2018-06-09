//
//  MusicListMusicListConfigurator.swift
//  mTunes
//
//  Created by Mergaliev Ibragim on 08/06/2018.
//  Copyright © 2018 InnoUniv. All rights reserved.
//

import UIKit

class MusicListModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? MusicListViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: MusicListViewController) {

        let router = MusicListRouter()

        let presenter = MusicListPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = MusicListInteractor()
        interactor.output = presenter
        
        
        //TODO: Replace with Typhoon
        let mam = MusicAPIManager()
        mam.musicListURL = "http://127.0.0.1:8000/api/v0/music/"
        mam.myMusicListURL = "http://127.0.0.1:8000/api/v0/mymusic/"
        mam.user = KeychainWrapper.standard.string(forKey: "login")
        mam.password = KeychainWrapper.standard.string(forKey: "password")
        interactor.musicAPIManager = mam
        
        

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
