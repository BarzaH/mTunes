//
//  AuthorizationAPIManager.swift
//  mTunes
//
//  Created by Mergaliev Ibragim on 08/06/2018.
//  Copyright © 2018 Mergaliev Ibragim. All rights reserved.
//

import Foundation
import Alamofire

class AuthorizationAPIManager: NSObject{
    
    @objc dynamic var loginURL: String?
    @objc dynamic var registrationURL: String?
    
    func sendLoginRequest(_ login: String, _ password: String, completion: @escaping () -> Void)
    {
        
        Alamofire.request(loginURL!, method: .post, parameters: ["username": login, "password": password]).responseJSON { response in

            if response.result.isSuccess{
                if let json = response.result.value as? [String: AnyObject] {
                    if let data = json["data"] as? [String: AnyObject], let token = data["token"] as? String
                    {
                        KeychainWrapper.standard.set(token, forKey: "token")
                        KeychainWrapper.standard.set(login, forKey: "login")
                        KeychainWrapper.standard.set(password, forKey: "password")
                        
                        completion()
                        
                    }
                }
            }
            
        }
        
    }
    
    
    func sendRegistratonRequest(){
        
    }
    
}
