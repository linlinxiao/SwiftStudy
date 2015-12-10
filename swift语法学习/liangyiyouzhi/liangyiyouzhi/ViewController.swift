//
//  ViewController.swift
//  liangyiyouzhi
//
//  Created by linlin on 15/12/9.
//  Copyright © 2015年 linlin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var dataList:[AnyObject]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        let manager = AFHTTPSessionManager(baseURL: NSURL(string: "http://www.cocoachina.com/industry/20140627/8962.html"))
        manager.responseSerializer.acceptableContentTypes?.insert("text/html")
        manager.GET("http://182.92.77.1:8000/product/list?direction=desc&orderBy=price.price&page=0&size=20", parameters: nil, success: { (task, obj) -> Void in

            let dic = obj as! NSDictionary
            let items = dic["items"] as! NSArray
            var temp = [AnyObject]()
            for item in items{
                let model = ServiceListModel(contentWithDic: item as! [NSObject : AnyObject])
                temp.append(model)
                print(model.productName)
            }
            self.dataList = temp
            self.tableView.reloadData()
            
            }) { (task, error) -> Void in
             print(error.userInfo)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController:UITableViewDataSource{
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataList?.count ?? 0
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 40
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell") ??  UITableViewCell(style: .Default, reuseIdentifier: "cell")
        let model = self.dataList![indexPath.row] as! ServiceListModel
        cell.textLabel?.textColor = UIColor.blackColor()
        cell.textLabel?.text = model.productName
        return cell
    }
    
}

extension ViewController:UITableViewDelegate{
}

