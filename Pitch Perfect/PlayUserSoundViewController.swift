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
    @IBOutlet weak var chipmunk: UIButton!
    
    var audioPlayer = AVAudioPlayer()
    var recievedAudio: RecordedAudio!
    var audioFile: AVAudioFile!
    var audioEngine: AVAudioEngine!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        audioFile = AVAudioFile(forReading: recievedAudio.filePathUrl, error: nil)
        audioPlayer = AVAudioPlayer(contentsOfURL: recievedAudio.filePathUrl, error:nil)
        audioPlayer.enableRate=true
        audioEngine = AVAudioEngine()

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
    
    @IBAction func Chipmunk(sender: UIButton)
    {
        playAudioWithVariablePitch(1000)
    }
    
    @IBAction func DarthVadar(sender: UIButton)
    {
        playAudioWithVariablePitch(-800)
    }
    
    func playAudioWithVariablePitch(pitch: Float){
        audioPlayer.stop()
        audioEngine.stop()
        audioEngine.reset()
        
        let audioPlayerNode = AVAudioPlayerNode()
        audioEngine.attachNode(audioPlayerNode)
        
        let changePitchEffect = AVAudioUnitTimePitch()
        changePitchEffect.pitch = pitch
        audioEngine.attachNode(changePitchEffect)
        
        audioEngine.connect(audioPlayerNode, to: changePitchEffect, format: nil)
        audioEngine.connect(changePitchEffect, to: audioEngine.outputNode, format: nil)
        
        audioPlayerNode.scheduleFile(audioFile, atTime: nil, completionHandler: nil)
        audioEngine.startAndReturnError(nil)
        
        audioPlayerNode.play()
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
