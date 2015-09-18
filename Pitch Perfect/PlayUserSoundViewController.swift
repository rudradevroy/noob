//
//  PlayUserSoundViewController.swift
//  Pitch Perfect
//
//  Created by Rudradev Roy on 17/09/15.
//  Copyright (c) 2015 Rudradev Roy. All rights reserved.
//

import UIKit
import AVFoundation

class PlayUserSoundViewController: UIViewController {
    
    @IBOutlet weak var Button: UIButton! //snail button
    
    @IBOutlet weak var SpeedUp: UIButton!
    
    @IBOutlet weak var stop1: UIButton!
    
    var audioPlayer = AVAudioPlayer()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        if var filePath = NSBundle.mainBundle().pathForResource("test", ofType: "mp3")
        {
            var song = NSURL.fileURLWithPath(filePath)
            audioPlayer = AVAudioPlayer(contentsOfURL: song!, error:nil)
            audioPlayer.enableRate=true
            
        }
            
        else
            
        {
            print("Path is empty")
        }
        // Do any additional setup after loading the view.
    }

    
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning() // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func SlowMo(sender: UIButton)
    {
        audioPlayer.stop()
        audioPlayer.rate = 0.5
        audioPlayer.play()
        // Play slow audio
        
    }
    @IBAction func IncreaseSpeed(sender: UIButton) {
            audioPlayer.stop()
            audioPlayer.rate = 1.5
            audioPlayer.play()
    }
   
    @IBAction func stop(sender: UIButton)
    {
        
        audioPlayer.stop()
    }
   
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
