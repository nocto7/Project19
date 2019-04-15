//
//  TableViewController.swift
//  Extension
//
//  Created by kirsty darbyshire on 15/04/2019.
//  Copyright © 2019 kirsty darbyshire. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var keys = [String]()
    var avc: ActionViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpKeys()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "js")
    }
    
    func setUpKeys() {
        keys = Array(avc.savedScripts.keys).sorted()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return keys.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "js", for: indexPath)
        cell.textLabel?.text = keys[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        avc.script.text = avc.savedScripts[keys[indexPath.row]]
        dismiss(animated: true)
    }
    
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let delete = UITableViewRowAction(style: .destructive, title: "Delete") { (action, indexPath) in
            let keyToDelete = self.keys[indexPath.row]
            self.avc.savedScripts.removeValue(forKey: keyToDelete)
            print("deleting \(keyToDelete)")
            self.setUpKeys()
            tableView.reloadData()
        }
        
        return [delete]
    }
    
}
