//
//  ViewController.swift
//  todolist
//
//  Created by Danil on 12.03.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textfiled: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func addtask(_ sender: Any) {
        let defaults = UserDefaults.standard
        
        let taskName = textfiled.text!
        
        var newTask = TaskItem()
        
        newTask.name = taskName
        
        
        do {
            if let data = defaults.data(forKey: "taskItemArray") {
                var array = try JSONDecoder().decode([TaskItem].self, from: data)
                
                array.append(newTask)
                
                let encodedata = try JSONEncoder().encode(array)
                
                defaults.setValue(encodedata, forKey: "taskItemArray")
            } else {
                
                let encodedata = try JSONEncoder().encode([newTask])
                
                defaults.setValue(encodedata, forKey: "taskItemArray")
            }
            
        } catch {
            print("unable to encode \(error)")
        }
        
        textfiled.text = ""
    }
    
}

