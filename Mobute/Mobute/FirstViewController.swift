//
//  FirstViewController.swift
//  Mobute
//
//  Created by Neil MacKenzie & David Piggott on 2015-04-02.
//  Copyright (c) 2015 Neil MacKenzie & David Piggott. All rights reserved.
//
//  This view contains the functionality for the primary 'Add Job' screen.


import UIKit

class FirstViewController: UIViewController {

    //Buttons
    @IBOutlet weak var startBtn: UIButton!
    @IBOutlet weak var endBtn: UIButton!
    @IBOutlet weak var updateBtn: UIButton! // actually is displays as save
    
    //Labels
    @IBOutlet weak var lblStart: UILabel!
    @IBOutlet weak var lblEnd: UILabel!
    
    //Text areas
    @IBOutlet weak var compText: UITextField!
    @IBOutlet weak var noteText: UITextView!
    
    //Variables
    var startButtonClicked:Bool = false
    var endButtonClicked:Bool = false
    
    @IBAction func btnStart(sender: AnyObject) {
        if(!startButtonClicked){
            startButtonClicked = true
            let rightNow = NSDate()
            let dateFormatter = NSDateFormatter()
            dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
            dateFormatter.timeStyle = NSDateFormatterStyle.ShortStyle
            
            lblStart.text = dateFormatter.stringFromDate(rightNow)
            
            endBtn.backgroundColor = UIColor.redColor() //Colours in the End Button
            
            startBtn.backgroundColor = UIColor.grayColor() //Greys out the Start Button
            
            allRecords.insert(Record(), atIndex: 0) //Adds new object
            
            println("Start button formatted but not saved")
            println(lblStart.text)
            
            //Fix this later!!!!!!
            currentRecordIndex = 0
            
            allRecords[currentRecordIndex].startDate = dateFormatter.stringFromDate(rightNow) //Saves startdate to object
            
            println("Saved to a record")
            println(allRecords[currentRecordIndex].startDate)
        }
    }
    

    @IBAction func btnUpdate(sender: AnyObject) {
        println("Update button click")
        println("*****")
        updateObject()
    }
    
    @IBAction func btnEnd(sender: AnyObject) {
        if(startButtonClicked && !endButtonClicked){
            endButtonClicked = true
            let rightNow = NSDate()
            let dateFormatter = NSDateFormatter()
            dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
            dateFormatter.timeStyle = NSDateFormatterStyle.ShortStyle
            
            lblEnd.text = dateFormatter.stringFromDate(rightNow)
            
            endBtn.backgroundColor = UIColor.grayColor() //Greys out the End button
        }
    }
    

    func updateObject(){
        
        
        //Start date is saved when the start date button is clicked
        //End date is saved when the dend date button is clicked
        
        //Saves the Company name
        if compText.text == ""{
                allRecords[currentRecordIndex].company = "Untitled company"
        }
        else {
            allRecords[currentRecordIndex].company = compText.text
        }
        
        //saves note text
        allRecords[currentRecordIndex].note = noteText.text
        
        
        //Saves data to permanent storage
        Record.saveNotes()
        
        println("Update before saving")
        println(allRecords[currentRecordIndex].startDate)
        println(allRecords[currentRecordIndex].company)
        println(allRecords[currentRecordIndex].note)

    }

    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

