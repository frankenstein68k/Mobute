//
//  JobDetailViewController.swift
//  Mobute
//
//  Created by David Piggott on 2015-04-12.
//  Copyright (c) 2015 Neil MacKenzie. All rights reserved.
//

import UIKit

class JobDetailViewController: UIViewController {
    
    
    @IBOutlet var jobTitleLabel: UILabel!
    
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
