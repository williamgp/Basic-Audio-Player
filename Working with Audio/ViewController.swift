//
//  ViewController.swift
//  Working with Audio
//
//  Created by William Peregoy on 2015/9/6.
//  Copyright © 2015年 William Peregoy. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {
    
    var player = AVAudioPlayer()


    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var scrubSlider: UISlider!
    
    @IBAction func play(sender: AnyObject) {
       
        player.play()
        
    }
    @IBAction func adjustScrub(sender: AnyObject) {
        
        player.currentTime = NSTimeInterval(scrubSlider.value)
    }
    
    @IBAction func pause(sender: AnyObject) {
        
        player.pause()
        
    }
    
    @IBAction func adjustVolume(sender: AnyObject) {
        
        player.volume = slider.value
        
        
    }
    
    @IBAction func restart(sender: AnyObject) {
        
        let audioPath = NSBundle.mainBundle().pathForResource("420", ofType: "mp3")!
        
        do {
            
            try player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: audioPath))
            
            player.play()
            
        } catch {
            
            // Process error here
        }
    
}
    
    func updateScrubSlider() {
        
        scrubSlider.value = Float(player.currentTime)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let audioPath = NSBundle.mainBundle().pathForResource("420", ofType: "mp3")!
        
        do {
            
            try player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: audioPath))
            
            scrubSlider.maximumValue = Float(player.duration)
            
        } catch {
            
            // Process error here
        }
        
        _ = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("updateScrubSlider"), userInfo: nil, repeats: true)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

