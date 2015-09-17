//
//  ViewController.swift
//  Pitch Perfect
//
//  Created by Rudradev Roy on 16/09/15.
//  Copyright (c) 2015 Rudradev Roy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var recordingInProgress: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    override func viewWillAppear(animated: Bool) {
        stopbutton.hidden=true
        recordButton.enabled=true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    

    @IBAction func recordAudio(sender: UIButton) {
        //TODO: "Record"
        recordingInProgress.hidden = false
        print("Recording Audio")
        stopbutton.hidden=false
        recordButton.enabled=false
    }
    
    
    @IBOutlet weak var stopbutton: UIButton!
    @IBAction func Stopper(sender: UIButton) {
        recordingInProgress.hidden=true
    
    }
    }

