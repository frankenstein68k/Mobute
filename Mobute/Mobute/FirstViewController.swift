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

    @IBOutlet weak var startBtn: UIButton!
    @IBOutlet weak var endBtn: UIButton!
    @IBOutlet weak var lblStart: UILabel!
    
    
    @IBOutlet weak var lblEnd: UILabel!
    
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
            //lblEnd.text = "huzzah"
            println("Entered compound if")
            
            endBtn.backgroundColor = UIColor.grayColor() //Greys out the End button
        }
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

