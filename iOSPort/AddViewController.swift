//
//  AddViewController.swift
//  iOSPort
//
//  Created by OrangeWorksMacOne on 12/3/17.
//  Copyright © 2017 apatel428. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet weak var keyField: UITextField!
    @IBOutlet weak var latField: UITextField!
    @IBOutlet weak var longField: UITextField!
    @IBOutlet weak var monthField: UITextField!
    @IBOutlet weak var yearField: UITextField!
    @IBOutlet weak var dayField: UITextField!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addReport(_ sender: Any) {
        let key = (keyField.text as! NSString).integerValue
        let lat = (latField.text as! NSString).doubleValue
        let long = (longField.text as! NSString).doubleValue
        let date = monthField.text! + "-" + dayField.text! + "-" + yearField.text!
        let report = Report.init(key,lat,long,date)
        keyList.append(report)
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
