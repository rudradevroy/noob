//
//  RecordsSoundsViewController.swift
//  Pitch Perfect
//
//  Created by Rudradev Roy on 16/09/15.
//  Copyright (c) 2015 Rudradev Roy. All rights reserved.
//

import UIKit
import AVFoundation


class RecordsSoundsViewController: UIViewController, AVAudioRecorderDelegate
{
    
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var recordingInProgress: UILabel!
    
    var audioRecorder: AVAudioRecorder!
    
    var recordedAudio: RecordedAudio!
    
    
    
    
    
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
        
        let dirPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as! String
        
        let recordingName = "my_audio.wav"
        let pathArray = [dirPath, recordingName]
        let filePath = NSURL.fileURLWithPathComponents(pathArray)
        print(filePath) 
        let session = AVAudioSession.sharedInstance()
        session.setCategory(AVAudioSessionCategoryPlayAndRecord, error: nil)
        
        audioRecorder = AVAudioRecorder(URL: filePath!, settings: nil, error: nil)
        audioRecorder.delegate=self
        audioRecorder.meteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
        
        
        recordingInProgress.hidden = false
        print("Recording Audio")
        stopbutton.hidden=false
        recordButton.enabled=false
        
        //TODO: "Record users voice"
        
    }
    
    func audioRecorderDidFinishRecording(recorder: AVAudioRecorder!, successfully flag: Bool)
    {
        
    if(flag)
        {
            recordedAudio = RecordedAudio()
            recordedAudio.filePathUrl = recorder.url
            recordedAudio.title = recorder.url.lastPathComponent
            self.performSegueWithIdentifier("StopRecording", sender: RecordedAudio.self)
        }
        
        else
        
        {
            print("recording was not successful")
            recordButton.enabled=true
            stopbutton.hidden=true
        
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
       
        if(segue.identifier == "StopRecording")
        {
            let playSoundsVC: PlayUserSoundViewController = segue.destinationViewController as! PlayUserSoundViewController
            
            let data = sender as! RecordedAudio
            
        }
    }
    
    
    
    @IBOutlet weak var stopbutton: UIButton!
    @IBAction func Stopper(sender: UIButton) {
       
        audioRecorder.stop()
        recordingInProgress.hidden = true
    
    }
    }

