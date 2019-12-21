//
//  ViewController.swift
//  Project 09 - VideoBackground
//
//  Created by Ryan on 2019/12/20.
//  Copyright © 2019 Ryan. All rights reserved.
//

import UIKit
import AVKit

class ViewController: UIViewController {
    
    var avplayer: AVPlayer!
    
    func setupView() {
        self.view.backgroundColor = .white
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        let path = Bundle.main.path(forResource: "moments", ofType: ".mp4")
        avplayer = AVPlayer(url: URL(fileURLWithPath: path!))
        avplayer.play()
        let avplayerViewController = AVPlayerViewController()
        avplayerViewController.player = avplayer
        self.view.addSubview(avplayerViewController.view)
    }
}

