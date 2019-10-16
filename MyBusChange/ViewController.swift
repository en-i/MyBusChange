//
//  ViewController.swift
//  MyBusChange
//
//  Created by 寺田縁 on 2019/08/28.
//  Copyright © 2019 Swift-Beginners. All rights reserved.
//
//SafariServicesをインポート
import UIKit
import SafariServices
//SFSafariViewControllerDelegateを追加
class ViewController: UIViewController,SFSafariViewControllerDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    //産交バスの時刻表に飛ぶコード
    @IBAction func sankouBusButton(_ sender: AnyObject) {
        let url = URL(string: "https://transfer.navitime.biz/sankobus/pc/map/Top")
        if let url = url{
            let safariViewController = SFSafariViewController(url:url)
            safariViewController.delegate = self
            present(safariViewController,animated:true, completion:nil)
        }
    }
    //都市バスの時刻表に飛ぶコード
    @IBAction func toshiBusButton(_ sender: Any) {
        let url = URL(string: "https://www.kumamoto-toshibus.co.jp")
        if let url = url{
            let safariViewController = SFSafariViewController(url:url)
            safariViewController.delegate = self
            present(safariViewController,animated: true, completion: nil)
        }
    }
   //safariが閉じられた時のコード(safariViewControllerDidFinish)
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        dismiss(animated: true, completion: nil)
    }
}

