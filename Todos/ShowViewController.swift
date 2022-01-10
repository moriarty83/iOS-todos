//
//  ShowViewController.swift
//  Todos
//
//  Created by Christopher M Moriarty on 1/10/22.
//

import UIKit

class ShowViewController: UIViewController {

    @IBOutlet weak var taskLabel: UILabel!
    
    var task: String?
    
    var taskIndex: Int?
    
    var update: (() -> Void)?
    
    @IBAction func deleteTask(_ sender: UIButton) {
        UserDefaults().set(taskIndex, forKey: "deleteIndex")
        
        update?()
        navigationController?.popViewController(animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        taskLabel.text = task

        // Do any additional setup after loading the view.
    }
    




}
