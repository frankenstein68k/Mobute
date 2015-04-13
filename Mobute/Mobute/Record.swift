//
//  Record.swift
//  Mobute
//
//  Created by Neil MacKenzie on 2015-04-12.
//  Copyright (c) 2015 Neil MacKenzie. All rights reserved.
//

import UIKit

//Global variables
var allRecords:[Record] = [] //An array of records, to hold all the records
var currentRecordIndex:Int = -1 //Used for determining which record we are working with
var recordTable:UITableView? //Used for displaying all the records

let kAllRecords:String = "records"

class Record: NSObject {
    //Variables holding the necessary information for each record object
    var startDate: String
    var endDate: String
    var company: String
    var memo: String
    
    //Constructor
    override init() {
        startDate = NSDate().description
        endDate = NSDate().description
        company = ""
        memo = ""
    }
    
    //Dictionary to hold data
    func dictionary() -> NSDictionary{
        return ["startDate": startDate, "endDate": endDate, "company": company, "memo": memo]
    }
    
    //Function to save records to storage
    class func saveNotes() {
        var aDictionaries:[NSDictionary] = []
        for var i:Int = 0; i < allRecords.count; i++ {
            aDictionaries.append(allRecords[i].dictionary())
        }
        
        NSUserDefaults.standardUserDefaults().setObject(aDictionaries, forKey: kAllRecords)
    }
    
    
    //Function to load records from storage
    class func loadNotes() {
        var defaults:NSUserDefaults = NSUserDefaults.standardUserDefaults()
        var savedData: [NSDictionary]? = defaults.objectForKey(kAllRecords) as?
            [NSDictionary]
        if let data:[NSDictionary] = savedData {
            for var i:Int = 0; i < data.count; i++ {
                var n:Record = Record()
                n.setValuesForKeysWithDictionary(data[i] as [NSObject : AnyObject])
                allRecords.append(n)
            }
        }
    }
    
}
