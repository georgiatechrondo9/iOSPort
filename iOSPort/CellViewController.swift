//
//  CellViewController.swift
//  iOSPort
//
//  Created by OrangeWorksMacOne on 12/3/17.
//  Copyright © 2017 apatel428. All rights reserved.
//

import UIKit

class CellViewController: UIViewController {

    @IBOutlet weak var cellLabel: UILabel!
    @IBOutlet weak var navItem: UINavigationItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if keyList.isEmpty {
            cellLabel.text = "Loading"
        } else {
            cellLabel.text = keyList[myIndex].reportToString()
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
