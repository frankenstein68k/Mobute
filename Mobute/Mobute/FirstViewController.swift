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
            
            //Fix this later!!!!!!
            currentRecordIndex = 0
            
            allRecords[currentRecordIndex].startDate = dateFormatter.stringFromDate(rightNow) //Saves startdate to object
        }
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
        if compText.text == ""{
                allRecords[currentRecordIndex].company = "Untitled company"
        }
        else {
            allRecords[currentRecordIndex].company = compText.text
        }
        
        allRecords[currentRecordIndex].company = noteText.text
        
        Record.saveNotes()
    
        
        /*
        if tView.text == "" {
            allNotes.removeAtIndex(currentNoteIndex)
        }
        else {
            allNotes[currentNoteIndex].note = tView.text
        }
        Note.saveNotes()
        noteTable?.reloadData()
*/
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

