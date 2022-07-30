//
//  AddViewController.swift
//  ToDoApp
//
//  Created by juri on 2022/07/29.
//

import UIKit

protocol SendTaskDelegate {
    func addTask()
}

class AddViewController: UIViewController {

    @IBOutlet var txtAdd: UITextField!

    var delegate: SendTaskDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        delegate?.addTask()
    }
    @IBAction func btnCalendar(_ sender: UIButton) {
        //calendar 팝업으로 날짜 지정
    }
    @IBAction func btnCalendarToday(_ sender: UIButton) {
        //오늘 날짜
        
    }
    @IBAction func btnCalendarTomorrow(_ sender: UIButton) {
        //내일 날짜
    }
    @IBAction func btnFixTask(_ sender: UIButton) {
        //할 일 고정
    }
    @IBAction func btnSetAlarm(_ sender: UIButton) {
        //알람 설정
    }
    @IBAction func btnAddTask(_ sender: UIButton) {
        //task 추가 후 main 으로 넘기기
        
        NotificationCenter.default.post(name: DidDismissPostCommentViewController, object: nil, userInfo: nil)
        
        self.dismiss(animated: true, completion: nil)
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
