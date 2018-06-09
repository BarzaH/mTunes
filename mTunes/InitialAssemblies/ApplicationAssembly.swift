//
//  ApplicationAssembly.swift
//  mTunes
//
//  Created by Mergaliev Ibragim on 08/06/2018.
//  Copyright © 2018 Mergaliev Ibragim. All rights reserved.
//

import Foundation
import Typhoon

public class ApplicationAssembly: TyphoonAssembly {

    public var coreComponents: CoreComponents?
//    private var musicListAssembly = MusicListModuleAssembly().activate()!
//
    

    
    @objc public dynamic func appDelegate() -> AnyObject {
        return TyphoonDefinition.withClass(AppDelegate.self) {
            definition in

            definition!.injectProperty("assembly")
            
            } as AnyObject
        
    }
    
    
    @objc public dynamic func authorizationAPIManager() -> AnyObject {
        return TyphoonDefinition.withClass(AuthorizationAPIManager.self) {
            definition in
            definition!.injectProperty("loginURL", with: "http://127.0.0.1:8000/api/v0/login/")
            definition!.injectProperty("registrationURL", with: "rr")
            } as AnyObject
    }
    
    
//    @objc public dynamic func musicListViewController() -> AnyObject {
//
//        return TyphoonDefinition.withClass(MusicListViewController.self) {
//            definition in
//
//            definition?.injectProperty("output", with: self.musicListAssembly.musicListPresenter(self))
//
//
//
////            definition!.useInitializer("initWithOutput:") {
////                initializer in
////
////                initializer!.injectParameter(with: self.musicListAssembly.musicListPresenter())
////            }
//
//            definition!.scope = TyphoonScope.singleton
//            } as AnyObject
//    }
    
   
    
}
