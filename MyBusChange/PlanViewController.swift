//
//  PlanViewController.swift
//  MyBusChange
//
//  Created by 寺田縁 on 2019/09/05.
//  Copyright © 2019 Swift-Beginners. All rights reserved.
//

import UIKit
//UITabBarDelegate,UITableViewDataSourceを追加
class PlanViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var TableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //入力された情報を表示するコード(UserDefault)
        if UserDefaults.standard.object(forKey: "addPlan") != nil{
            plan = UserDefaults.standard.object(forKey: "addPlan") as! [String]
        }
        
    }
    //追加(TableViewを使用する時)
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    //Cellの個数を指定するコード(numberOfRowsInSection)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return plan.count
    }
    //Cellの中身を設定するコード(cellForRowAt)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let planCell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "planBusTime",for: indexPath)
        planCell.textLabel!.text = plan[indexPath.row]
        return planCell
    }
    //Cellの編集の許可(canEditRowAt)
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    //スワイプすることでCellの削除
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete{
            plan.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath as IndexPath], with: UITableView.RowAnimation.automatic)
            //情報の更新
             UserDefaults.standard.set(plan, forKey: "addPlan")
        }
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
