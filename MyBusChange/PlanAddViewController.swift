//
//  PlanAddViewController.swift
//  MyBusChange
//
//  Created by 寺田縁 on 2019/09/05.
//  Copyright © 2019 Swift-Beginners. All rights reserved.
//

import UIKit
//予定追加のための変数
var plan = [String]()
//UITextFieldDelegateを追加
class PlanAddViewController: UIViewController,UITextFieldDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        //テキストに表示させておく文字列のコード(placeholder)
        dayText.delegate = self
        placeText.delegate = self
        busTimeText.delegate = self
        dayText.placeholder = "日付"
        placeText.placeholder = "行き先"
        busTimeText.placeholder = "バスの時刻"
    }
    //追加(TabieViewを使用する時)
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    //キーボードが出た状態でテキスト外をタッチするとキーボードを閉じるコード
    //touchesBegan=画面を触った時
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    //完了を押した時にキーボードを閉じるコード(resignFirstResponder)
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    @IBOutlet weak var dayText: UITextField!
    @IBOutlet weak var placeText: UITextField!
    @IBOutlet weak var busTimeText: UITextField!
    //追加ボタンを押した時に予定を追加し、予定の画面を表示するコード
    @IBAction func planAddButton(_ sender: Any) {
        if busTimeText.text == ""{
            
        }else{
            plan.append(busTimeText.text!)
        }
        if dayText.text == ""{
            
        }else{
            plan.append(dayText.text!)
        }
        if placeText.text == ""{
            
        }else{
            plan.append(placeText.text!)
        }
        dayText.text = ""
        placeText.text = ""
        busTimeText.text = ""
        //入力された情報を記憶するコード
        UserDefaults.standard.set(plan, forKey: "addPlan")
        //予定を表示するコード
        performSegue(withIdentifier: "planList", sender: nil)
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
