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
    
    var output: MusicListViewOutput!
    var appAssembly: ApplicationAssembly?
    
//    var filteredData: [String]!
    
    var rows = [Music](){
        didSet{
            self.tableView.reloadData()
        }
    }
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.searchBar.delegate = self
        
        output.viewIsReady()
    }


    // MARK: MusicListViewInput
    func updateState(rows: [Music]) {        
        self.rows = rows
    }
}

extension MusicListViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        let nos = (self.searchBar.text?.isEmpty)! ? 1 : 2
        
        return nos
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rows.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            
        let model = rows[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellReuseIdentifier", for: indexPath) as! MusicListCell
        cell.model = model
        return cell
            
        }
        else {
            
            let model = rows[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellReuseIdentifier", for: indexPath) as! MusicListCell
            cell.model = model
            return cell
            
        }
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "My music"
        }
        else{
            return "Global search"
        }
    }
}


extension MusicListViewController{
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        self.output.searchBarTextChanged(newText: searchText)
        
    }
}
