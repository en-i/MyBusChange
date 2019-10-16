//
//  SundayViewController.swift
//  MyBusChange
//
//  Created by 寺田縁 on 2019/09/04.
//  Copyright © 2019 Swift-Beginners. All rights reserved.
//

import UIKit
//UITableViewDelegate,UITableViewDataSourceを追加
class SundayViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var TableView: UITableView!
    let sunday = ["6:26~7:01","7:13~7:48","7:45~8:20","7:53~8:28","8:01~8:36","8:22~8:57","8:32~9:06","8:45~9:20","9:13~9:51","9:38~10:17","9:51~10:30","9:59~10:39","10:16~10:55","10:24~11:04","10:31~11:10","11:00~11:39","11:11~11:50","11:21~12:00","11:43~12:22","12:17~12:56","12:33~13:12","12:55~13:34","13:23~14:02","13:46~14:25","14:25~15:04","14:44~15:24","14:58~15:38","15:05~15:44","15:24~16:04","15:53~16:32","16:13~16:52","16:33~17:12","16:44~17:24","16:57~17:37","17:43~18:22","18:02~18:41","18:27~19:06","18:44~19:19","19:02~19:36","20:17~20:51"]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    //追加(TableViewを使用する時)
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    //日曜のバス時刻を表示するコード
    //Cellの個数を指定するコード(numberOfRowsInSection)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sunday.count
    }
    //Cellの中身を設定するコード(cellForRowAt)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "sundayBusTime",for: indexPath)
        cell.textLabel!.text = sunday[indexPath.row]
        return cell
    }
    //Cellがタッチされた時に予定追加に飛ぶコード(didSelectRowAt)
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "savePlan", sender: nil)
        //ハイライト解除(deselectRow)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    //Homeボタンを押した時にHome画面を表示するコード（popToRootViewControllerでNavigation Controllerに直接つながる画面に移動する）
    @IBAction func homeButton(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
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
