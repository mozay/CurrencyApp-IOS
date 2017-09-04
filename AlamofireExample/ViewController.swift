//
//  ViewController.swift
//  AlamofireExample
//
//  Created by MEHMET on 3.09.2017.
//  Copyright © 2017 MEHMET. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var dataTable: UITableView!
    var arrRes = [[String:AnyObject]]() //Array of dictionary
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        getData()
        
    }
    
    
    func getData(){
        Alamofire.request("https://api.doviz.com/list/C").validate().responseJSON { response in
            switch response.result {
            case .success:
                if((response.result.value) != nil) {
                    let swiftyJsonVar = JSON(response.result.value!)
                    
                    if let resData = swiftyJsonVar["value"].arrayObject {
                        self.arrRes = resData as! [[String:AnyObject]]
                        
                    }
                    if self.arrRes.count > 0 {
                        self.dataTable.reloadData()
                    }
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:CustomRow = tableView.dequeueReusableCell(withIdentifier: "rowID") as! CustomRow
        var dict = self.arrRes[indexPath.row]
        cell.currencyName.text = dict["adi"] as? String
        
        let alisPrice = dict["alis"] as? String
         cell.buyPrice.text = alisPrice
        
        let satisPrice = dict["satis"] as? String
        cell.salePrice.text = satisPrice
        
        let changeValue = dict["upDown"] as? Int
        if changeValue == -1 {
            cell.changePic.image = UIImage(named : "sort-down.png")
        }else{
            cell.changePic.image = UIImage(named : "caret-arrow-up.png")
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrRes.count
    }
  
    
}

