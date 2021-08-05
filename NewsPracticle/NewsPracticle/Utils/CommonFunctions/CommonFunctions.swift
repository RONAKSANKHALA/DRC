//
//  CommonFunctions.swift
//  SevenPeaksCarFeedTest
//
//  Created by Ronak Sankhala on 30/07/21.
//

import Foundation
import UIKit

class CommonFunctions: NSObject {
    @objc class TestClass: NSObject {}
    static let Instance = CommonFunctions()
    
    //Convert String to date based on API Date Formate(dd.MM.yyyy HH:mm)
    func stringToDate(stringDate: String?) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss+00:00"
        guard let dateToConvert = stringDate else { return "" }
        guard let dates = formatter.date(from: dateToConvert) else { return "" }
        formatter.dateFormat = "dd MMMM, yyyy hh:mm a"
        let stringDate = formatter.string(from: dates)
        return stringDate
    }
}
