//
//  SoundManager.swift
//  Alias Party
//
//  Created by Mark on 05.05.2022.
//

import Foundation
import AVFoundation

struct SoundManager {
    
    var player: AVAudioPlayer!
    
    mutating func playSound(soundName: String) {
        let url = Bundle.main.url(forResource: "\(soundName)", withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
}
