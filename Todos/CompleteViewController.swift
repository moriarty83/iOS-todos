//
//  CompleteViewController.swift
//  Todos
//
//  Created by Christopher M Moriarty on 1/11/22.
//

import UIKit

var completedTasks = UserDefaults().value(forKey: "completedTasks") as? [String] ?? [String]()

class CompleteViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return completedTasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = completedTasks[indexPath.row]
        return cell
    }
    

    @IBOutlet weak var completeTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        completeTableView.delegate = self
        completeTableView.dataSource = self
        
        update()
        // Do any additional setup after loading the view.
    }
    
    func update(){
        completedTasks = UserDefaults().value(forKey: "completedTasks") as? [String] ?? [String]()
        completeTableView.reloadData()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
