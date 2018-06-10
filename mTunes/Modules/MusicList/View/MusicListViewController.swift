//
//  MusicListMusicListViewController.swift
//  mTunes
//
//  Created by Mergaliev Ibragim on 08/06/2018.
//  Copyright © 2018 InnoUniv. All rights reserved.
//

import UIKit

class MusicListViewController: UITableViewController, UISearchBarDelegate, MusicListViewInput {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var profileButton: UIBarButtonItem!
    
    var output: MusicListViewOutput!
    var appAssembly: ApplicationAssembly?
    
    @IBAction func addMusic(_ sender: UIButton) {
        
        sender.setTitle("Added", for: .normal)
        
        var senderCell = sender.superview?.superview as! UITableViewCell
        
        let indexPath = self.tableView.indexPath(for: senderCell)
        
        senderCell = self.tableView.cellForRow(at: indexPath!)!
        
        output.addToMyMusic(cell: senderCell as! GlobalMusicListCell)
    }
    
    
    func loadMenu(){
        if revealViewController() != nil{
            profileButton.target = revealViewController()
            profileButton.action = #selector(SWRevealViewController.revealToggle(_:))
            revealViewController().rearViewRevealWidth = 275
            
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }
    
    
    
    var myMusicRows = [Music](){
        didSet{
            self.tableView.reloadData()
        }
    }
    
    var globalMusicRows = [Music](){
        didSet{
            self.tableView.reloadData()
        }
    }
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.searchBar.delegate = self
        
        loadMenu()
        output.viewIsReady()
    }


    // MARK: MusicListViewInput
    func updateState(myMusicRows: [Music]) {        
        self.myMusicRows = myMusicRows
    }
    
    func updateState(globalMusicRows: [Music]) {
        self.globalMusicRows = globalMusicRows
    }
}

extension MusicListViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        let nos = (self.searchBar.text?.isEmpty)! || self.globalMusicRows.count == 0 ? 1 : 2
        
        return nos
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return section == 0 ? myMusicRows.count : globalMusicRows.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            
        let model = myMusicRows[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellReuseIdentifier", for: indexPath) as! MyMusicListCell
        cell.model = model
        return cell
            
        }
        else {
            
            let model = globalMusicRows[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "globalCellReuseIdentifier", for: indexPath) as! GlobalMusicListCell
            cell.model = model
            return cell
            
        }
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? "My music" : "Global search"
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(55)
    }
}


extension MusicListViewController{
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        self.output.searchBarTextChanged(newText: searchText)
        
    }
}
