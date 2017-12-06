//
//  MapViewController.swift
//  iOSPort
//
//  Created by OrangeWorksMacOne on 12/3/17.
//  Copyright © 2017 apatel428. All rights reserved.
//

import UIKit
import GoogleMaps

var startDateArray = [Int]()
var endDateArray = [Int]()
var pinList = [GMSMarker]()

class MapViewController: UIViewController {

    
    @IBOutlet weak var startMonth: UITextField!
    @IBOutlet weak var startDay: UITextField!
    @IBOutlet weak var startYear: UITextField!
    @IBOutlet weak var endMonth: UITextField!
    @IBOutlet weak var endDay: UITextField!
    @IBOutlet weak var endYear: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func mapButtonOnClick(_ sender: Any) {
        if getDate() {
            let start = dateToCompareValue(array: startDateArray)
            let end = dateToCompareValue(array: endDateArray)
            pinList = [GMSMarker]()
            for report in keyList {
                var date = dateToCompareValue(array: dateToIntArray(date: report.createdDate))
                if date > start && date < end && report.uniqueKey != nil {
                    var marker = GMSMarker()
                    marker.position = CLLocationCoordinate2D(latitude: report.latitude, longitude: report.longitude)
                    marker.title = String(report.uniqueKey)
                    pinList.append(marker)
                }
            }
        } else {
            let alert = UIAlertController(title: "Error", message: "Enter all fields", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func getDate() -> Bool {
        let startMonthText: String? = startMonth.text
        let startDayText: String? = startDay.text
        let startYearText: String? = startYear.text
        let endMonthText: String? = endMonth.text
        let endDayText: String? = endDay.text
        let endYearText: String? = endYear.text
        if (startMonthText != nil && startDayText != nil && startYearText != nil && endDayText != nil && endYearText != nil && endMonthText != nil) {
            startDateArray = [(startMonthText as! NSString).integerValue,(startDayText as! NSString).integerValue,(startYearText as! NSString).integerValue]
            endDateArray = [(endMonthText as! NSString).integerValue,(endDayText as! NSString).integerValue,(endYearText as! NSString).integerValue]
            return true
        } else {
            let alert = UIAlertController(title: "Error", message: "Enter all fields", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
            return false
        }
    }
    
    func dateToIntArray(date: String) -> [Int] {
        let array = date.components(separatedBy: "-")
        let arrayNum = [(array[0] as! NSString).integerValue, (array[1] as! NSString).integerValue, (array[2] as! NSString).integerValue]
        return arrayNum
    }
    
    func dateToCompareValue(array: [Int]) -> Int {
        let month = array[0]
        let day = array[1]
        let year = array[2]
        let num = year * 1000 + month * 100 + day
        return num
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
