//
//  ViewController.swift
//  Project 17 LimitTextField
//
//  Created by Ryan on 2020/2/7.
//  Copyright © 2020 Ryan. All rights reserved.
//

import UIKit

let Frame = UIScreen.main.bounds
let ScreenWidth = Frame.width
let ScreenHeight = Frame.height

class ViewController: UIViewController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    lazy var leftTopButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 15, y: 30, width: 60, height: 40))
        button.setTitle("Close", for: .normal)
        button.setTitleColor(UIColor(red: 60/255, green: 67/255, blue: 207/255, alpha: 1.0), for: .normal)
        return button
    }()
    
    lazy var rightTopButton: UIButton = {
        let button = UIButton(frame: CGRect(x: ScreenWidth - 75, y: 30, width: 60, height: 40))
        button.setTitle("Tweet", for: .normal)
        button.setTitleColor(UIColor.systemGreen, for: .normal)
        return button
    }()
    
    lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 20, y: 100, width: 50, height: 50))
        imageView.image = #imageLiteral(resourceName: "Kobe")
        imageView.layer.cornerRadius = imageView.frame.width / 2
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var textView: UITextView = {
        let textView = UITextView(frame: CGRect(x: 90, y: 100, width: 270, height: 270))
        textView.backgroundColor = .clear
        textView.textColor = UIColor.white
        textView.font = UIFont.systemFont(ofSize: 20)
        textView.delegate = self
        return textView
    }()
    
    
    lazy var button1: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 620, width: 30, height: 30))
        button.setImage(#imageLiteral(resourceName: "Camera"), for: .normal)
        return button
    }()
    
    lazy var button2: UIButton = {
        let button = UIButton(frame: CGRect(x: 65, y: 620, width: 30, height: 30))
        button.setImage(#imageLiteral(resourceName: "Search"), for: .normal)
        return button
    }()
    
    lazy var button3: UIButton = {
        let button = UIButton(frame: CGRect(x: 110, y: 620, width: 30, height: 30))
        button.setImage(#imageLiteral(resourceName: "Paper"), for: .normal)
        return button
    }()
    
    lazy var button4: UIButton = {
        let button = UIButton(frame: CGRect(x: 155, y: 620, width: 30, height: 30))
        button.setImage(#imageLiteral(resourceName: "GPS"), for: .normal)
        return button
    }()
    
    lazy var label: UILabel = {
        let label = UILabel(frame: CGRect(x: ScreenWidth - 80, y: 620, width: 60, height: 30))
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = UIColor(red: 60/255, green: 67/255, blue: 207/255, alpha: 1.0)
        label.text = "100"
        return label
    }()
    
    func setupView() {
        view.backgroundColor = .black
        view.addSubview(leftTopButton)
        view.addSubview(rightTopButton)
        view.addSubview(avatarImageView)
        view.addSubview(textView)
        view.addSubview(button1)
        view.addSubview(button2)
        view.addSubview(button3)
        view.addSubview(button4)
        view.addSubview(label)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        // Do any additional setup after loading the view.
    }
    
    
}

extension ViewController: UITextViewDelegate {
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let length = textView.text.count + text.count - range.length
        if length > 100 {
            return false
        } else {
            label.text = String(100 - length)
            return true
        }
        //let inputLength = text.count - range.length + textView.text.count
    }
}
