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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
