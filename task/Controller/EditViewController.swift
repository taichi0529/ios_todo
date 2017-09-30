//
//  EditViewController.swift
//  task
//
//  Created by 中村太一 on 2017/09/30.
//  Copyright © 2017年 中村太一. All rights reserved.
//

import UIKit

class EditViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var labelTitle: UITextField!
    let taskCollection = TaskCollection.sharedInstance
    var targetTask: Task?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        try! targetTask = taskCollection.getTargetTask()
        labelTitle.text = targetTask!.title
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapGesture))
        self.view.addGestureRecognizer(tapRecognizer)
        
        labelTitle.delegate = self
    }
    
    //画面をタップすると、キーボードが閉じる動作
    @objc func tapGesture(sender: UITapGestureRecognizer) {
        labelTitle.resignFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func deleteButtonDidTouch(_ sender: Any) {
        let alert = UIAlertController(title:"エラー", message: "本当に削除してもいい？", preferredStyle: UIAlertControllerStyle.alert)

        let action1 = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: {
            (action: UIAlertAction!) in
            self.taskCollection.deleteTargetTask()
            self.navigationController?.popViewController(animated: true)
        })
        alert.addAction(action1)
        let action2 = UIAlertAction(title: "キャンセル", style: UIAlertActionStyle.default, handler: {
            (action: UIAlertAction!) in
            print("キャンセル")
        })
        alert.addAction(action2)

        self.present(alert, animated: true, completion: nil)
        
    }
    @IBAction func saveButtonDidTouch(_ sender: Any) {
        if(labelTitle.text!.isEmpty){
            let alert = UIAlertController(title:"エラー", message: "タスクを入力して下さい", preferredStyle: UIAlertControllerStyle.alert)
            
            let action1 = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: {
                (action: UIAlertAction!) in
                print("アクション１をタップした時の処理")
            })
            alert.addAction(action1)
            
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        print (self.targetTask!.title)
        
//        self.taskCollection.save()
//        let task = Task()
//        task.title = labelTitle.text!
//        self.taskCollection.replaceTask(task)
        self.taskCollection.updateTargetTask(labelTitle.text!)
        self.taskCollection.save()
        self.navigationController?.popViewController(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
