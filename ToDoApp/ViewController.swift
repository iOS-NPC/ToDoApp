//
//  ViewController.swift
//  ToDoApp
//
//  Created by 남경민 on 2022/07/17.
//

import UIKit

let DidDismissPostCommentViewController: Notification.Name = Notification.Name("DidDismissPostCommentViewController")

class ViewController: UIViewController, SendTaskDelegate {
    
    func addTask() {
        //추가 기능
    }
    
    @IBOutlet weak var toDoTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "DO!"
        self.makeNavigationBar()
        
        toDoTableView.delegate = self
        toDoTableView.dataSource = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.didDismissPostCommentNotification(_:)), name: DidDismissPostCommentViewController, object: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "modalAddTask" {
            guard let viewController: AddViewController = segue.destination as? AddViewController
            else {return}
            viewController.delegate = self
            
        }
    }
    
    func makeNavigationBar() {
        let item = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewTodo))
        
        navigationItem.rightBarButtonItem = item
    }
    
    @objc func addNewTodo() {
        
    }
    @objc func didDismissPostCommentNotification(_ noti: Notification)
    {
          // task 추가


    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCell", for: indexPath)
        return cell
    }
}


