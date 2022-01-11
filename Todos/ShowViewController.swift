//
//  ShowViewController.swift
//  Todos
//
//  Created by Christopher M Moriarty on 1/10/22.
//

import UIKit

class ShowViewController: UIViewController {

    @IBOutlet weak var taskLabel: UILabel!
    
    var taskManager = TaskManager()
    
    var task: String?
    
    var taskIndex: Int?
    
    var update: (() -> Void)?
    
    
    @IBAction func completeTask(_ sender: UIButton) {
        taskManager.completeTask(taskIndex: taskIndex ?? 0)
        update?()
        navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func tapEdit(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "edit") as! EditViewController
        vc.title = "Edit Task"
        vc.taskIndex = taskIndex
        vc.update = self.update
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        taskLabel.text = task

        // Do any additional setup after loading the view.
    }
    




}
