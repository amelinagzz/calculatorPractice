//
//  AudioService.swift
//  RetroCalculator
//
//  Created by Adriana Gonzalez on 5/17/16.
//  Copyright © 2016 Adriana Gonzalez. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class AudioService {
    
    static let instance = AudioService()
    
    private var _soundFXPlayer: AVAudioPlayer?
    
    var soundFXPlayer: AVAudioPlayer?{
        get{
              return _soundFXPlayer
        }
        set{
            _soundFXPlayer = newValue
        }
    }
    
    var btnUrl: NSURL?{
        
        if let urlStr = pathForResource("btn", fileType: "wav"){
            return NSURL(string: urlStr)
        }
        return nil
    }
    
    func pathForResource(fileName: String, fileType: String) -> String?{
        return NSBundle.mainBundle().pathForResource(fileName, ofType: fileType)
    }
    
    func createPlayerWithUrl(audioUrl: NSURL) -> AVAudioPlayer?{
        do{
            return try AVAudioPlayer(contentsOfURL: audioUrl)
        } catch let err as NSError{
            return nil
        }
        
    }
    
    func playCurrentSoundFX() -> Bool{
        
        if let player = soundFXPlayer{
            
            if player.playing {
                soundFXPlayer?.stop()
            }
            
            soundFXPlayer?.play()
            return player.playing
        }
        return false
    }
}