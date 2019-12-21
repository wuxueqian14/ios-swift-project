//
//  ViewController.swift
//  Project 07 - Random Color Gradient
//
//  Created by Ryan on 2019/12/19.
//  Copyright © 2019 Ryan. All rights reserved.
//

import UIKit
import AVFoundation

let frame = UIScreen.main.bounds
let ScreenWidth = frame.width
let ScreenHeight = frame.height

class ViewController: UIViewController {
    
    lazy var button:UIButton = {
        let button = UIButton(frame: CGRect(x: ScreenWidth / 2 - 100, y: ScreenHeight / 2 - 100, width: 200, height: 200))
        button.setImage(UIImage(named: "music play"), for: .normal)
        button.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
        return button
    }()
    
    let gradientLayer = CAGradientLayer()
    
    var audioPlayer: AVAudioPlayer?
    
    var timer: Timer?
    
    var backgroundColor: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat)! {
        didSet {
            let color1 = UIColor(red: backgroundColor.blue,
                                 green: backgroundColor.green,
                                 blue: 0,
                                 alpha: backgroundColor.alpha).cgColor
            let color2 = UIColor(red: 1.0 - backgroundColor.red,
                                 green: backgroundColor.green,
                                 blue: 1.0 - backgroundColor.blue,
                                 alpha: backgroundColor.alpha).cgColor
            gradientLayer.colors = [color1, color2]
        }
    }
    
    @objc func changeColor() {
        let redValue = CGFloat(drand48())
        let greenValue = CGFloat(drand48())
        let blueValue = CGFloat(drand48())
        backgroundColor = (redValue, greenValue, blueValue, 0.5)
    }
    
    @objc func tapButton() {
            let path = Bundle.main.path(forResource: "Legends Never Die", ofType: ".mp3")
            do {
                try audioPlayer = AVAudioPlayer(contentsOf: URL(fileURLWithPath: path!))
                audioPlayer?.play()
                audioPlayer?.volume = 1.0
            }
            catch let audioError as NSError {
                print(audioError)
            }
            
            if (timer == nil) {
                timer = Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(changeColor), userInfo: nil, repeats: true)
            }
            gradientLayer.frame = frame
            gradientLayer.startPoint = CGPoint(x: 0, y: 0)
            gradientLayer.endPoint = CGPoint(x: 1, y: 1)
            self.button.isEnabled = false
    }
    
    func setupView() {
        self.view.backgroundColor = UIColor(red: 132/255, green: 112/255, blue: 255/255, alpha: 1.0)
        self.view.layer.addSublayer(gradientLayer)
        self.view.addSubview(button)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        // Do any additional setup after loading the view.
    }


}

