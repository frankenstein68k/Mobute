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
    
    //Button actions
    @IBAction func btnStart(sender: AnyObject) {
        if(!startButtonClicked){
            startButtonClicked = true
            
            
            currentRecordIndex = findAllRecordsCount()
            println("Current Record Index is ")
            println(currentRecordIndex)
            
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
            
            
            allRecords[currentRecordIndex].startDate = dateFormatter.stringFromDate(rightNow) //Saves startdate to object
            
            //Cludge to save trouble farther down the line. Just automatically give end date and end date
            allRecords[currentRecordIndex].endDate = dateFormatter.stringFromDate(rightNow)
            
            println("Saved to a record")
            println(allRecords[currentRecordIndex].startDate)
        }
    }

    @IBAction func btnCount(sender: AnyObject) {
        println("***Record Count is..***")
        println(findAllRecordsCount())
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
            
            allRecords[currentRecordIndex].endDate = dateFormatter.stringFromDate(rightNow) //Saves end date to object
            
            popUpConfirmation()
        }
    }
    
    
    
    //Functions 
    
    //Gets the length
    func findAllRecordsCount() -> Int{
        //println("Getting record count")
        //println(allRecords.count)
        return allRecords.count
    }

    func updateObject(){
        //Start date is saved when the start date button is clicked
        //End date is saved when the end date button is clicked
        
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
        
        println("Saving to permanent storage")
        println(allRecords[currentRecordIndex].startDate)
        println(allRecords[currentRecordIndex].endDate)
        println(allRecords[currentRecordIndex].company)
        println(allRecords[currentRecordIndex].note)
    }

    func popUpConfirmation(){
        endBtn.backgroundColor = UIColor.redColor() //Greys out the End button
        updateObject()
        
        let alert = UIAlertController(title: "Finished?",
            message: "If you have finished the task tap OK",
            preferredStyle: .Alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) {ACTTION -> Void in
            self.endBtn.backgroundColor = UIColor.greenColor() //Greys out the End button
            self.lblEnd.text = "-"
            self.endButtonClicked = false
        }
        alert.addAction(cancelAction)

        let okAction = UIAlertAction(title: "OK", style: .Default) {ACTION -> Void in
            self.resetFirstViewController()
        }
        alert.addAction(okAction)
        
        presentViewController(alert, animated: true, completion: nil)
    }
    
    func resetFirstViewController(){
        println("Resetting first view controller")
        startButtonClicked = false
        endButtonClicked = false
        lblStart.text = "-"
        lblEnd.text = "-"
        compText.text = ""
        noteText.text = ""
        
        startBtn.backgroundColor = UIColor(red: (64/255.0), green: (128/255.0), blue: (0), alpha: 1.0) //Changes start button back to green, need to work
        
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        Record.loadNotes()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

