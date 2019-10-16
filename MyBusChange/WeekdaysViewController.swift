//
//  WeekdaysViewController.swift
//  MyBusChange
//
//  Created by 寺田縁 on 2019/09/04.
//  Copyright © 2019 Swift-Beginners. All rights reserved.
//

import UIKit
//UITableViewDelegate,UITableViewDataSourceを追加
class WeekdaysViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var TableView: UITableView!
    let weekdays = ["6:04~6:40","6:11~6:49","6:20~7:00","6:22~7:05","6:35~7:24","6:41~7:31","6:47~7:40","7:11~8:05","7:13~8:07","7:28~8:22","7:47~8:39","7:53~8:45","8:09~8:55","8:27~9:11","8:43~9:25","9:14~9:57","9:31~10:14","9:36~10:19","9:51~10:34","10:09~10:52","10:24~11:07","10:50~11:32","11:05~11:47","11:31~12:14","11:41~12:24","12:08~12:51","12:33~13:15","12:57~13:40","13:22~14:04","13:53~14:35","14:27~15:09","14:36~15:19","14:44~15:27","15:04~15:46","15:16~15:59","15:41~16:24","16:04~16:47","16:09~16:51","16:30~17:16","16:40~17:26","17:15~18:06","17:30~18:20","17:58~18:53","18:15~19:05","18:16~19:06","18:36~19:21","19:19~19:54","19:43~20:18","20:26~21:01","20:42~21:17","21:06~21:41","21:46~22:21"]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    //追加(TableViewを使用する時)
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    //平日のバス時刻を表示するコード
    //Cellの個数を指定するコード(numberOfRowsInSection)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weekdays.count
    }
    //Cellの中身を設定するコード(cellForRowAt)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "weekdaysBusTime",for: indexPath)
        cell.textLabel!.text = weekdays[indexPath.row]
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
