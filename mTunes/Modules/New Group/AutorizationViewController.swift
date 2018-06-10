//
//  ViewController.swift
//  mTunes
//
//  Created by Mergaliev Ibragim on 05/06/2018.
//  Copyright © 2018 Mergaliev Ibragim. All rights reserved.
//

import UIKit

class AutorizationViewController: UIViewController {

    @IBOutlet weak var login: UITextField!
    @IBOutlet weak var password: UITextField!
    
    var appAssembly: ApplicationAssembly?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // TODO: check if user already authorized
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func login(_ sender: Any) {
        let apiManager = appAssembly!.authorizationAPIManager() as! AuthorizationAPIManager
        
        apiManager.sendLoginRequest(self.login.text!, self.password.text!){ [weak self] in
            self?.successAuthentication()
        }
    }
    
    func successAuthentication(){
        
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let swReveal = storyboard.instantiateViewController(withIdentifier: "SwRevealController") as! SWRevealViewController

        let nc = storyboard.instantiateViewController(withIdentifier: "MainNavigationController") as! UINavigationController
        let musicVC = nc.viewControllers.first as! MusicListViewController
        
        musicVC.appAssembly = self.appAssembly
        swReveal.frontViewController = nc
        
        UIApplication.shared.delegate?.window!!.rootViewController = swReveal
        
    }
    
   

}

