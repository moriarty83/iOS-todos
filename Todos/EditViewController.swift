//
//  EditViewController.swift
//  Todos
//
//  Created by Christopher M Moriarty on 1/10/22.
//

import UIKit

class EditViewController: UIViewController {
    
    var taskManager = TaskManager()
    
    var taskIndex: Int?
    
    var update: (() -> Void)?
    
    var tasks = UserDefaults().value(forKey: "tasks") as? [String] ?? [String]()
    
    @IBOutlet weak var taskText: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        taskText.text = tasks[taskIndex ?? 0]

    }
    
    @IBAction func updateTask(_ sender: UIBarButtonItem) {
        tasks[taskIndex ?? 0 ] = taskText.text ?? "Edited Task"
        UserDefaults().set(tasks, forKey: "tasks")
        update?()
        navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func deleteTask(_ sender: UIButton) {
        taskManager.deleteTask(taskIndex: taskIndex!)
        update?()
        navigationController?.popToRootViewController(animated: true)
    }
    


}
