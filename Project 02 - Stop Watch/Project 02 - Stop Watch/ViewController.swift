//
//  ViewController.swift
//  Project 02 - Stop Watch
//
//  Created by 吴学谦 on 2019/12/15.
//  Copyright © 2019 Ryan.com. All rights reserved.
//

import UIKit

let ScreenWidth = UIScreen.main.bounds.width
let ScreenHeight = UIScreen.main.bounds.height

class ViewController: UIViewController {
    
    var time: Float = 0.0 {
        didSet {
            topLabel.text = String(format: "%.1f", time)
        }
    }
    
    lazy var resetButton: UIButton = {
        let button = UIButton(type: UIButton.ButtonType.custom)
        button.frame = CGRect(x: ScreenWidth * 0.75, y: 40, width: 80, height: 60)
        button.backgroundColor = .systemPurple
        button.layer.cornerRadius = 20
        button.setTitle("Reset", for: .normal)
        button.addTarget(self, action: #selector(tapResetButton), for: .touchUpInside)
        return button
    }()
    
    lazy var startButton: UIButton = {
        let button = UIButton(type: UIButton.ButtonType.custom)
        button.frame = CGRect(x: 0, y: ScreenHeight * 0.4, width: ScreenWidth * 0.5, height: ScreenHeight * 0.6)
        button.backgroundColor = .systemBlue
        button.setImage(UIImage(named: "start"), for: .normal)
        button.addTarget(self, action: #selector(tapStartButton), for: .touchUpInside)
        return button
    }()
    
    lazy var pauseButton: UIButton = {
        let button = UIButton(type: UIButton.ButtonType.custom)
        button.frame = CGRect(x: ScreenWidth * 0.5, y: ScreenHeight * 0.4, width: ScreenWidth * 0.5, height: ScreenHeight * 0.6)
        button.backgroundColor = .systemGreen
        button.setImage(UIImage(named: "pause"), for: .normal)
        button.addTarget(self, action: #selector(tapPauseButton), for: .touchUpInside)
        return button
    }()
    
    lazy var topLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: ScreenHeight * 0.4))
        label.text = "0.0"
        label.font = UIFont.systemFont(ofSize: 35)
        label.textAlignment = .center
        return label
    }()

    func setupView() {
        self.view.backgroundColor = .white
        self.view.addSubview(startButton)
        self.view.addSubview(pauseButton)
        self.view.addSubview(topLabel)
        self.view.addSubview(resetButton)
        //topLabel.addSubview(resetButton)
        //self.view.addSubview(topLabel)
    }
    
    var timer: Timer? = Timer()
    
    var isTapStartButton: Bool = false
    
    @objc func tapStartButton() {
        isTapStartButton = true
        startButton.isEnabled = false
        pauseButton.isEnabled = true
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }
    
    @objc func tapPauseButton() {
        if (isTapStartButton) {
            isTapStartButton = false
            startButton.isEnabled = true
            pauseButton.isEnabled = false
            timer?.invalidate() // stop timer and remove from its run loop
            timer = nil
        }
    }
    
    @objc func tapResetButton() {
        startButton.isEnabled = true
        pauseButton.isEnabled = true
        timer?.invalidate()
        timer = nil
        time = 0.0
    }

    @objc func updateTime() {
        time = time + 0.1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        // Do any additional setup after loading the view.
    }
    
    
    
}

