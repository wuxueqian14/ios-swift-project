//
//  ViewController.swift
//  Project 09 - VideoBackground
//
//  Created by Ryan on 2019/12/20.
//  Copyright © 2019 Ryan. All rights reserved.
//

import UIKit
import AVKit

let frame = UIScreen.main.bounds
let ScreenWidth = frame.width
let ScreenHeight = frame.height

class ViewController: UIViewController {
    
    lazy var logoImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: ScreenWidth / 2 - 167, y: 50, width: 334, height: 100))
        let image = #imageLiteral(resourceName: "logo")
        imageView.image = image
        return imageView
    }()
    
    lazy var loginBtn: UIButton = {
        let btn = UIButton(frame: CGRect(x: 0, y: ScreenHeight - 50, width: ScreenWidth / 2, height: 50))
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.setTitle("Login", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        btn.backgroundColor = UIColor(red: 35/255.0, green: 36/255.0, blue: 38/255.0, alpha: 1)
        return btn
    }()
    
    lazy var signUpBtn: UIButton = {
        let btn = UIButton(frame: CGRect(x: ScreenWidth / 2, y: ScreenHeight - 50, width: ScreenWidth / 2, height: 50))
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.setTitle("Register", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        btn.backgroundColor = UIColor(red: 42/255.0, green: 183/255.0, blue: 90/255.0, alpha: 1)
        return btn
    }()
    
    lazy var backgroundPlayer: AVPlayer = {
        let path = Bundle.main.path(forResource: "moments", ofType: "mp4")
        let url = URL(fileURLWithPath: path!)
        let player = AVPlayer(url: url)
        return player
    }()
    
    func backgroundVideo() {
        let playerLayer = AVPlayerLayer(player: backgroundPlayer)
        playerLayer.frame = CGRect(x: 0, y: 0, width: ScreenWidth, height: ScreenHeight - 50)
        playerLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        view.layer.addSublayer(playerLayer)
        backgroundPlayer.play()
    }
    
    @objc func didFinished(notification: Notification) {
        if let playerItem = notification.object as? AVPlayerItem {
            playerItem.seek(to: CMTime.zero, completionHandler: nil)
            backgroundPlayer.play()
        }
    }
    
    func setupView() {
        self.view.addSubview(logoImageView)
        self.view.addSubview(loginBtn)
        self.view.addSubview(signUpBtn)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundVideo()
        setupView()
        NotificationCenter.default.addObserver(self, selector: #selector(didFinished(notification:)), name: Notification.Name.AVPlayerItemDidPlayToEndTime, object: backgroundPlayer.currentItem)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

