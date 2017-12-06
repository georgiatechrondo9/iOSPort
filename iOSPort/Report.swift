//
//  Report.swift
//  iOSPort
//
//  Created by OrangeWorksMacOne on 12/3/17.
//  Copyright © 2017 apatel428. All rights reserved.
//

import Foundation

class Report {
    var uniqueKey: Int
    var latitude: Double
    var longitude: Double
    var createdDate: String
    
    func reportToString() -> String {
        let string = "Unique Key: " + String(uniqueKey) + "\nLatitude: " + String(latitude) + "\nLongitude: " + String(longitude) + "\nCreated Date: " + createdDate
        return string
    }
    
    init(_ key: Int,_ lat: Double,_ long: Double,_ date: String) {
        self.uniqueKey = key
        self.latitude = lat
        self.longitude = long
        self.createdDate = date
    }
}
