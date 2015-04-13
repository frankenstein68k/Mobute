//
//  FirstViewController.swift
//  Mobute
//
//  Created by Neil MacKenzie on 2015-04-02.
//  Copyright (c) 2015 Neil MacKenzie. All rights reserved.
//

//dskjhfkjsdhfkjsdf

import UIKit

class FirstViewController: UIViewController {

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
            
        }
    }
    
    
    @IBAction func btnEnd(sender: AnyObject) {
        if(!endButtonClicked){
            endButtonClicked = true
            let rightNow = NSDate()
            let dateFormatter = NSDateFormatter()
            dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
            dateFormatter.timeStyle = NSDateFormatterStyle.ShortStyle
            
            lblEnd.text = dateFormatter.stringFromDate(rightNow)
            
        }
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

