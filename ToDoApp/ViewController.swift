//
//  ViewController.swift
//  ToDoApp
//
//  Created by 남경민 on 2022/07/17.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var toDoTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "DO!"
        self.makeNavigationBar()
        
        toDoTableView.delegate = self
        toDoTableView.dataSource = self
    }
    
    func makeNavigationBar() {
        let item = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewTodo))
        
        navigationItem.rightBarButtonItem = item
    }
    
    @objc func addNewTodo() {
        
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
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        // 왼쪽에 만들기
        
        let complete = UIContextualAction(style: .normal, title: "완료") { (UIContextualAction, UIView, success: @escaping (Bool) -> Void) in
            print("완료 클릭 됨")
            success(true)
        }
        complete.backgroundColor = .systemBlue
        complete.image = UIImage(named: "complete")
        complete.title = nil
        
        let tack = UIContextualAction(style: .normal, title: "압정") { (UIContextualAction, UIView, success: @escaping (Bool) -> Void) in
            print("압정 클릭 됨")
            success(true)
        }
        tack.backgroundColor = .systemBlue
        tack.image = UIImage(named: "tack")
        tack.title = nil
        
        let reiterate  = UIContextualAction(style: .normal, title: "반복") { (UIContextualAction, UIView, success: @escaping (Bool) -> Void) in
            print("반복할 일 클릭 됨")
            success(true)
        }
        reiterate.backgroundColor = .systemBlue
        reiterate.image = UIImage(named: "reiterate")
        reiterate.title = nil
        
        //actions배열 인덱스 0이 왼쪽에 붙어서 나옴
        return UISwipeActionsConfiguration(actions:[complete, tack, reiterate])
        
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        // 오른쪽에 만들기
        
        let modity = UIContextualAction(style: .normal, title: "수정") { (UIContextualAction, UIView, success: @escaping (Bool) -> Void) in
            print("수정 클릭 됨")
            success(true)
        }
        modity.backgroundColor = .systemBlue
        modity.image = UIImage(named: "modify.png")
        modity.title = nil
        
        let move = UIContextualAction(style: .normal, title: "이동") { (UIContextualAction, UIView, success: @escaping (Bool) -> Void) in
            print("그룹 이동 클릭 됨")
            success(true)
        }
        move.backgroundColor = .systemBlue
        move.image = UIImage(named: "move.png")
        move.title = nil
        
        let delete = UIContextualAction(style: .normal, title: "삭제") { (UIContextualAction, UIView, success: @escaping (Bool) -> Void) in
            print("삭제 클릭 됨")
            success(true)
            //dataArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        delete.backgroundColor = .systemRed
        delete.image = UIImage(named: "delete.png")
        delete.title = nil
        
        //actions배열 인덱스 0이 오른쪽에 붙어서 나옴
        return UISwipeActionsConfiguration(actions:[delete, move, modity])
    }
}


