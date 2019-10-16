//
//  File.swift
//  MyBusChange
//
//  Created by 寺田縁 on 2019/09/21.
//  Copyright © 2019 Swift-Beginners. All rights reserved.
//

import UIKit
//Mapkitをインポート
import MapKit
//UITextFieldDelegateを追加
class BusSearchViewController: UIViewController,UITextFieldDelegate{
    //一次元配列
    var csvLines = [String]()
    //二次元配列
    var busArray = [[String]]()
    //pin用変数
    var i = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Textfield.delegate = self
        //csvと接続するコード
        guard let path = Bundle.main.path(forResource:"samplebusstop", ofType:"csv") else {
            print("csvファイルがないよ")
            return
        }
        do{
            //データをString型で代入するコード
            let csvString = try String(contentsOfFile: path, encoding: String.Encoding.utf8)
            //データを改行(\n)ごとに分け、一次元配列に代入するコード
            csvLines = csvString.components(separatedBy:"\n")
            csvLines.removeLast()
        }catch let error as NSError {
            print("エラー: \(error)")
            return
        }
        for data in csvLines {
            // データを,ごとに分け、二次元配列に代入するコード
            if data != "" {
                busArray.append(data.components(separatedBy: ","))
            }
        }
        for _ in csvLines{
            //バス停の緯度
            let busStopLatitude = Double(busArray[i][1])
            //バス停の経度
            let busStopLongitude = Double(busArray[i][2])
            //バス停の名前
            let busStopName = busArray[i][3]
            //バス停にピンを置くコード
            let pin = MKPointAnnotation()
            pin.coordinate = CLLocationCoordinate2D(latitude: busStopLatitude ?? nil!, longitude: busStopLongitude ?? nil!)
            pin.title = busStopName
            self.busStopMap.addAnnotation(pin)
            i += 1
        }
    }
    
    @IBOutlet weak var Textfield: UITextField!
    
    
    @IBOutlet weak var busStopMap: MKMapView!
    
    
    
    
    
    
    func textFieldShouldReturn(_ textField: UITextField)  -> Bool {
        //キーボードを閉じるコード
        textField.resignFirstResponder()
        if let searchKey = textField.text {
            print(searchKey)
            //緯度、経度を取得するコード
            let geocoder = CLGeocoder()
            geocoder.geocodeAddressString(searchKey, completionHandler: { (placemarks, error) in
                if let unwrapPlacemarks = placemarks{
                    if let firstPlacemark = unwrapPlacemarks.first {
                        if let location = firstPlacemark.location {
                            let targetCoordinate = location.coordinate
                            print(targetCoordinate)
                            //ピンを置くコード
                            let pin = MKPointAnnotation()
                            pin.coordinate = targetCoordinate
                            pin.title = searchKey
                            self.busStopMap.addAnnotation(pin)
                            self.busStopMap.region = MKCoordinateRegion(center: targetCoordinate, latitudinalMeters: 300.0, longitudinalMeters: 300.0)
                        }
                        
                    }
                }
            })
        }
        return true
    }
}
