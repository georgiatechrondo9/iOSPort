//
//  ViewController.swift
//  iOSPort
//
//  Created by OrangeWorksMacOne on 12/2/17.
//  Copyright © 2017 apatel428. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
var keyList = [Report]()
var myIndex = 0

class ViewController: UIViewController {

    @IBOutlet weak var  emailButton: UITextField!
    @IBOutlet weak var passwordButton: UITextField!
    var ref: DatabaseReference!
    var refHandle: DatabaseHandle?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("Load")
        self.ref = Database.database().reference()
        var count = 0
        self.refHandle = self.ref?.child("reports").observe(DataEventType.value, with: { (snapshot) in
            for child in snapshot.children {
                let child = child as! DataSnapshot
                let uniqueKeyNSNumber = child.childSnapshot(forPath: "uniquekey").value as? NSNumber
                let latitudeNSNumber = child.childSnapshot(forPath: "latitude").value as? NSNumber
                let longitudeNSNumber = child.childSnapshot(forPath: "longitude").value as? NSNumber
                let dateNSString = child.childSnapshot(forPath: "createddate").value as? NSString
                if (uniqueKeyNSNumber != nil && latitudeNSNumber != nil && longitudeNSNumber != nil && dateNSString != nil) {
                    if let uniqueKey = uniqueKeyNSNumber {
                        if let latitude = latitudeNSNumber {
                            if let longitude = longitudeNSNumber {
                                if let date = dateNSString {
                                    let uniqueKeyInt = uniqueKey.intValue
                                    let latitudeDouble = latitude.doubleValue
                                    let longitudeDouble = longitude.doubleValue
                                    let dateString = String(date)
                                    let report = Report.init(uniqueKeyInt, latitudeDouble, longitudeDouble, dateString)
                                    keyList.append(report)
                                    count = count + 1
                                    //print("count: " + String(count) + "\n" + report.reportToString())
                                }
                            }
                        }
                    }
                    
                }
            }
            print("read")
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func loginButtonPressed(_ sender: Any) {
        if isValidEmail(testStr: emailButton.text!) && passwordButton.text != "" {
            Auth.auth().signIn(withEmail: emailButton.text!, password: passwordButton.text!) { (user, error) in
                if error == nil {
                    let alert = UIAlertController(title: "Login Successful", message: "GJ", preferredStyle: .alert)
                    let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alert.addAction(action)
                    self.present(alert, animated: true, completion: nil)
 
                } else {
                    let alert = UIAlertController(title: "Login Failed", message: "Try Again", preferredStyle: .alert)
                    let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alert.addAction(action)
                    self.present(alert, animated: true, completion: nil)
 
                }
            }
        } else {
            let alert = UIAlertController(title: "Bad Email", message: "Enter a proper email", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func registerButtonPressed(_ sender: Any) {
        if emailButton.text == ""  || passwordButton.text == "" {
            let alertController = UIAlertController(title: "Error", message: "Please enter your email and password", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            present(alertController, animated: true, completion: nil)
            
        } else {
            Auth.auth().createUser(withEmail: emailButton.text!, password: passwordButton.text!) { (user, error) in
                
                if error == nil {
                    let alert = UIAlertController(title: "Success", message: "Try logging in.", preferredStyle: .alert)
                    
                    let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alert.addAction(action)
                    
                    self.present(alert, animated: true, completion: nil)
                    
                } else {
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }
    
    func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
}

