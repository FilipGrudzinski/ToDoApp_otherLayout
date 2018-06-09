//
//  ViewController.swift
//  ToDoApp_otherLayout
//
//  Created by Filip on 09.06.2018.
//  Copyright © 2018 Filip. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    
    @IBOutlet weak var table: UITableView!
    
    var items: [String] = []
    
    @IBAction func clearAllButton(_ sender: Any) {
        
        items.removeAll()
        table.reloadData()
    }
    
    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return items.count
        
    }
    
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        cell.textLabel?.text = items[indexPath.row]
        return cell
        
    }

    
    override func viewDidAppear(_ animated: Bool) {
        
        let itemsObject = UserDefaults.standard.object(forKey: "items")
        if let tempItems = itemsObject as? [String] {
            
            items = tempItems
            
        }
        
        table.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.delete {
            
            items.remove(at: indexPath.row)
            table.reloadData()
            UserDefaults.standard.set(items, forKey: "items")
        
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

