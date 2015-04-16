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
    
    @IBAction func loadBtn(sender: AnyObject) {
        println("LoadButton clicked")
        retrieveObject()
    }
    
    func retrieveObject(){
        println("Retrieving data")
        Record.loadNotes()
        println(allRecords[0].startDate)
        println(allRecords[0].endDate)
        println(allRecords[0].company)
        println(allRecords[0].note)        
    }
    
    var jobTitle = String()
    
    //Assigns the job title to the label
    override func viewWillAppear(animated: Bool) {
        jobTitleLabel.text = jobTitle
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
