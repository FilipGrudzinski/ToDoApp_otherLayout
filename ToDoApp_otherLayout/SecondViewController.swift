//
//  SecondViewController.swift
//  ToDoApp_otherLayout
//
//  Created by Filip on 09.06.2018.
//  Copyright © 2018 Filip. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    override func viewDidAppear(_ animated: Bool) {
        
        textField.becomeFirstResponder()
        
        
    }
    
    @IBAction func saveButton(_ sender: Any) {
       
        
        if (textField?.text?.trimmingCharacters(in: .whitespaces).isEmpty)! {
            
            textField.placeholder = "Enter an item"
            textField.text = ""
            
        } else {
            
            let itemsObject = UserDefaults.standard.object(forKey: "items")
            
            var items: [String]
            
            if let tempItems = itemsObject as? [String] {
                
                items = tempItems
                
                items.append(textField.text!)
                
            } else {
                
                items = [textField.text!]
                
            }
            UserDefaults.standard.set(items, forKey: "items")
            textField.placeholder = "More to do?"
            textField.text = ""
        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }


}
