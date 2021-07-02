//
//  ViewController.swift
//  play2
//
//  Created by Андрей Сигида on 19/03/2020.
//  Copyright © 2020 Андрей Сигида. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var player = AVAudioPlayer()
    let slider1 = UISlider()
    let music = ["Paradise Lost - Embers Fire","Paradise Lost - Forging Sympathy","Beatles - Yellow Submarine"]
    var x = 0
    var label1 = UILabel()
    var songName = ""
    
    @IBOutlet weak var slider2: UISlider!
    
    @IBOutlet weak var label2: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //метка
        
        self.label1.frame = CGRect(x: 10, y: 100, width: 400, height: 50)
        label1.text = music[x]
        self.view.addSubview(label1)
        
        //Slider1
        self.slider1.frame = CGRect(x: 0, y: 0, width: 200, height: 25)
        self.slider1.center = self.view.center
        self.slider1.minimumValue = 0.0
        self.slider1.maximumValue = 100.0
        self.view.addSubview(slider1)
        self.slider1.addTarget(self, action: #selector(changeSlider), for: .valueChanged)
        
        //Добавка файла
        do {
            if   let audioPath = Bundle.main.path(forResource: music[x], ofType: "mp3"){
                try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))}
            self.slider1.maximumValue = Float(player.duration)
        }
        catch{
            print("Error")
        }
        self.player.play()
        
    }
    @objc func changeSlider (sender: UISlider){
        if sender == slider1{
            self.player.currentTime = TimeInterval(sender.value)
        }
    }
    
    
    @IBAction func playButton(_ sender: Any) {
        self.player.play()
    }
    
    @IBAction func pauseButton(_ sender: Any) {
        self.player.pause()
    }
    @IBAction func slider2(_ sender: Any) {
        self.player.volume = slider2.value
    }
    @IBAction func nextSong(_ sender: Any) {
        x += 1
        if x > music.count-1 {
            x=0
        }
        viewDidLoad()
    }
    
    
    @IBAction func returnButton(_ sender: Any) {
        x -= 1
        if x < 0 {
            x = music.count - 1
        }
        viewDidLoad()
    }
    
}





