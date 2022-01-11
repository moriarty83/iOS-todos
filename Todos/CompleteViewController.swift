//
//  ComppleteViewController.swift
//  Todos
//
//  Created by Christopher M Moriarty on 1/11/22.
//

import UIKit

class CompleteViewController: UIViewController {

    @IBOutlet weak var completedTableView: UITableView!
    
    let taskManager = TaskManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
       
    }
}

extension EditViewController: UITableViewDelegate{
    
    func completedTableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
}

extension EditViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "completedCell", for: indexPath)
        cell.textLabel?.text = taskManager.completedTasks[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskManager.completedTasks.count
    }
    
}


