//
//  SecondViewController.swift
//  Mobute
//
//  Created by Neil MacKenzie on 2015-04-02.
//  Copyright (c) 2015 Neil MacKenzie. All rights reserved.
//
// This view generates the table list of the saved jobs

import UIKit

class SecondViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var tableView: UITableView!
    
    //Array of the list of jobs
    let jobData = ["Job 1", "Job 2", "Job 3", "Job 4", "Job 5", "Job 6", "Job 7", "Job 8", "Job 9", "Job 10", "Job 11", "Job 12", "Job 13", "Job 14"]
    
    let textCellIdentifier = "TextCell"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    //Returns the number of sections in the table
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    //Returns the number of rows
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jobData.count
    }
    
    //Assigns the data from the array to the table
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(textCellIdentifier, forIndexPath: indexPath) as! UITableViewCell
        
        let row = indexPath.row
        cell.textLabel?.text = jobData[row]
        
        return cell
    }
    
    //Deselects the row when pressed
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let row = indexPath.row
    }
    
    //Passes the necessary information to the Job Detail screen
    let jobSegueIdentifier = "ShowJobSegue"
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == jobSegueIdentifier {
            if let destination = segue.destinationViewController as? JobDetailViewController {
                if let jobIndex = tableView.indexPathForSelectedRow()?.row {
                    destination.jobTitle = jobData[jobIndex]
                }
            }
        }
    }
    

}

