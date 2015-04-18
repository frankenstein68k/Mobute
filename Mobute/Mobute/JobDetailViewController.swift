//
//  JobDetailViewController.swift
//  Mobute
//
//  Created by Neil MacKenzie & David Piggott on 2015-04-12.
//  Copyright (c) 2015 Neil MacKenzie & David Piggott. All rights reserved.
//
//  This view controls the job detail screen.

import UIKit

class JobDetailViewController: UIViewController {
    
    
    @IBOutlet var jobTitleLabel: UILabel!
    
    @IBOutlet weak var startLbl: UILabel!
    
    @IBOutlet weak var endLbl: UILabel!
    
    @IBOutlet weak var hoursLbl: UILabel!
    
    @IBOutlet weak var notesBox: UITextView!
    
    @IBAction func loadBtn(sender: AnyObject) {
        println("LoadButton clicked")
        retrieveObject()
    }
    
    func retrieveObject(){
        println("Retrieving data")
        //Record.loadNotes()
    
        
        println("zero index")
        println(allRecords[0].startDate)
        println(allRecords[0].endDate)
        println(allRecords[0].company)
        println(allRecords[0].note)
        
        
        println("1 index")
        println(allRecords[1].startDate)
        println(allRecords[1].endDate)
        println(allRecords[1].company)
        println(allRecords[1].note)
        
        /*
        println("2 index")
        println(allRecords[2].startDate)
        println(allRecords[2].endDate)
        println(allRecords[2].company)
        println(allRecords[2].note)
        
        
        println("3 index")
        println(allRecords[3].startDate)
        println(allRecords[3].endDate)
        println(allRecords[3].company)
        println(allRecords[3].note)
        */
        
    }
    
    var jobTitle = String()
    
    //Assigns the job title to the label
    override func viewWillAppear(animated: Bool) {
        retrieveObject()
        
        jobTitleLabel.text = allRecords[0].company
        startLbl.text = allRecords[0].startDate
        endLbl.text = allRecords[0].endDate
        hoursLbl.text = "20 minutes"
        notesBox.text = allRecords[0].note
        
        //Test
        println("The difference between start and end time is ")
       
        /*
        let rightNow = NSDate()
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
        dateFormatter.timeStyle = NSDateFormatterStyle.ShortStyle
        
        lblEnd.text = dateFormatter.stringFromDate(rightNow)
        */
        
        println("Try to do math with dates")
        var startTimeDate = allRecords[0].startDate
        var endTimeDate = allRecords[0].endDate
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
        dateFormatter.timeStyle = NSDateFormatterStyle.ShortStyle
        var aaaa = dateFormatter.dateFromString(startTimeDate)
        var bbbb = dateFormatter.dateFromString(endTimeDate)
        println(aaaa)
        println(bbbb)
        //var cccc = aaaa!.timeIntervalSinceDate(bbbb!)
        //println(cccc)
        

        //println(allRecords[0].endDate - allRecords[0].startDate)
        
        //What should be printed
        println(jobTitleLabel.text)
        println(startLbl.text)
        println(endLbl.text)
        println(hoursLbl.text)
        println(notesBox.text)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

}
