//
//  MusicAPIManager.swift
//  mTunes
//
//  Created by Mergaliev Ibragim on 09/06/2018.
//  Copyright © 2018 Mergaliev Ibragim. All rights reserved.
//

import Foundation
import Alamofire

class MusicAPIManager: NSObject{
    @objc dynamic var myMusicListURL: String?
    @objc dynamic var musicListURL: String?
    
    @objc dynamic var user: String?
    @objc dynamic var password: String?
    //        let token = KeychainWrapper.standard.string(forKey: "token")
    
    func sendMusicListRequest(completion: @escaping (String) -> Void)
    {
        
        let credential = URLCredential(user: user!, password: password!, persistence: .forSession)
        
        Alamofire.request(musicListURL!, method: .get).authenticate(usingCredential: credential).responseJSON { response in
            
            if response.result.isSuccess, let data = response.result.value{
                completion(data as! String)
            }
        }
    }
    
    func sendMyMusicListRequest(completion: @escaping (String) -> Void)
    {
        
        let credential = URLCredential(user: user!, password: password!, persistence: .forSession)
        
        Alamofire.request(myMusicListURL!, method: .get).authenticate(usingCredential: credential).responseJSON { response in
            
            if response.result.isSuccess, let data = response.result.value{
                completion(data as! String)
            }
        }
    }
    
    
}
