//
//  SaturdayViewController.swift
//  MyBusChange
//
//  Created by 寺田縁 on 2019/09/04.
//  Copyright © 2019 Swift-Beginners. All rights reserved.
//

import UIKit
//UITableViewDelegate,UITableViewDataSourceを追加
class SaturdayViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var TableView: UITableView!
    let saturday = ["6:06~6:40","6:26~7:00","6:58~7:35","7:10~7:47","7:31~8:08","7:54~8:31","8:03~8:40","8:25~9:02","8:45~9:24","9:02~9:50","9:15~10:04","9:24~10:12","9:42~10:30","9:53~10:41","10:07~10:55","10:25~11:14","10:32~11:20","10:58~11:46","11:07~11:55","11:40~12:28","12:03~12:52","12:34~13:22","12:53~13:35","13:02~13:44","13:23~14:05","13:53~14:35","14:12~14:54","14:43~15:25","14:45~15:28","14:52~15:34","15:09~15:51","15:26~16:09","15:56~16:38","16:15~16:57","16:32~17:17","16:45~17:33","16:52~17:41","17:15~18:04","17:31~18:19","17:51~18:39","18:09~18:58","18:40~19:21","18:56~19:32","19:01~19:37","19:12~19:47","19:40~20:15","20:11~20:46","20:44~21:19","21:30~22:05"]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    //追加(TableViewを使用する時)
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    //土曜のバス時刻を表示するコード
    //Cellの個数を指定するコード(numberOfRowsInSection)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return saturday.count
    }
    //Cellの中身を設定するコード(cellForRowAt)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "saturdayBusTime",for: indexPath)
        cell.textLabel!.text = saturday[indexPath.row]
        return cell
    }
    //Cellがタッチされた時に予定追加に飛ぶコード(didSelectRowAt)
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "savePlan", sender: nil)
        //ハイライト解除(deselectRow)
        tableView.deselectRow(at: indexPath, animated: true)
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
