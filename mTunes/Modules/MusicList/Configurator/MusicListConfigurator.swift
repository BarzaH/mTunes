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

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
