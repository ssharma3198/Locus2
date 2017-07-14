//
//  BroadcastingViewController.swift
//  Locus
//
//  Created by limao on 7/12/17.
//  Copyright © 2017 limao. All rights reserved.
//

import UIKit

class BroadcastingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var seachBar: UISearchBar!
    
    @IBAction func send(_ sender: UIButton) {
        print (sendTo)
        sendTo.removeAll()
        table.reloadData()
    }
    
    @IBOutlet weak var send: UIButton!
    
    private let allFriends = ["Alice", "bob", "Cara", "Cat", "Dara", "Elle", "France", "Gio", "Alice2", "bob2", "Cara2", "Cat2", "Dara2", "Elle2", "France2", "Gio2"]
    private var sendTo = [String]()
    private var filteredFriends = [String]()
    private var isSearching = false
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearching {
            return filteredFriends.count
        }
        return allFriends.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        // let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        if (isSearching) {
            cell.textLabel?.text = filteredFriends[indexPath.row]
        } else {
            cell.textLabel?.text = allFriends[indexPath.row]
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if isSearching {
            sendTo.append(filteredFriends[indexPath.row])
        } else {
            sendTo.append(allFriends[indexPath.row])
        }
        let selectedCell = tableView.cellForRow(at: indexPath)
        selectedCell?.contentView.backgroundColor = UIColor(red: 0.471, green: 0.859, blue: 0.886, alpha: 1)
        
        send.isHidden = false
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let tempSendTo = sendTo.filter {$0 != allFriends[indexPath.row]}
        sendTo = tempSendTo
        let deselectedRow = tableView.cellForRow(at: indexPath)
        deselectedRow?.contentView.backgroundColor = UIColor.white
        
        if (sendTo.count == 0) {
            send.isHidden = true
        }
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if (searchBar.text == nil || searchBar.text == "") {
            isSearching = false
        } else {
            isSearching = true
            filteredFriends = allFriends.filter({$0.lowercased().contains(searchText.lowercased())})
        }
        table.reloadData()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.allowsMultipleSelection = true
        //seachBar.delegate = self
        seachBar.returnKeyType = UIReturnKeyType.done
        
        send.isHidden = true
      //  table.tableHeaderView = seachBar
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

