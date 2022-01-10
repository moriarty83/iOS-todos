//
//  CreateViewController.swift
//  Todos
//
//  Created by Christopher M Moriarty on 1/8/22.
//

import UIKit

class CreateViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var taskText: UITextField!
    
    var update: (() -> Void)?
    
    @IBAction func saveTask(_ sender: UIBarButtonItem) {
        
        guard let text = taskText.text, !text.isEmpty else {
            return
        }
        
        
//        guard let taskCount = UserDefaults().value(forKey: "taskCount") as? Int else{
//            return
//        }
//
//        let newCount = taskCount + 1
//
//        UserDefaults().set(newCount, forKey: "taskCount")

        UserDefaults().set(text, forKey: "newTask")

        update?()
        
        navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        taskText.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        
        return true
    }
    
    
}
