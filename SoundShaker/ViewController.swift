//
//  ViewController.swift
//  SoundShaker
//
//  Created by Ricardo Hui on 29/3/2019.
//  Copyright © 2019 Ricardo Hui. All rights reserved.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {
    
    var player = AVAudioPlayer()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if event?.subtype == UIEvent.EventSubtype.motionShake{
            let soundArray = ["doorbell", "alert"]
            let randomNumber  = Int(arc4random_uniform(UInt32(soundArray.count)))
            let fileLocation = Bundle.main.path(forResource: soundArray[randomNumber], ofType:"mp3")
            do {
                try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: fileLocation!))
                
                player.play()
            }catch{
                
            }
        }
    }

}

