//
//  MusicListMusicListConfiguratorTests.swift
//  mTunes
//
//  Created by Mergaliev Ibragim on 08/06/2018.
//  Copyright © 2018 InnoUniv. All rights reserved.
//

import XCTest

class MusicListModuleConfiguratorTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testConfigureModuleForViewController() {

        //given
        let viewController = MusicListViewControllerMock()
        let configurator = MusicListModuleConfigurator()

        //when
        configurator.configureModuleForViewInput(viewInput: viewController)

        //then
        XCTAssertNotNil(viewController.output, "MusicListViewController is nil after configuration")
        XCTAssertTrue(viewController.output is MusicListPresenter, "output is not MusicListPresenter")

        let presenter: MusicListPresenter = viewController.output as! MusicListPresenter
        XCTAssertNotNil(presenter.view, "view in MusicListPresenter is nil after configuration")
        XCTAssertNotNil(presenter.router, "router in MusicListPresenter is nil after configuration")
        XCTAssertTrue(presenter.router is MusicListRouter, "router is not MusicListRouter")

        let interactor: MusicListInteractor = presenter.interactor as! MusicListInteractor
        XCTAssertNotNil(interactor.output, "output in MusicListInteractor is nil after configuration")
    }

    class MusicListViewControllerMock: MusicListViewController {

        var setupInitialStateDidCall = false

        override func setupInitialState() {
            setupInitialStateDidCall = true
        }
    }
}
