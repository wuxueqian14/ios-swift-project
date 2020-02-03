//
//  MenuViewController.swift
//  Project 16 - Tumblr Menu
//
//  Created by Ryan on 2020/2/3.
//  Copyright © 2020 Ryan. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    
    lazy var effectView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
        let effectView = UIVisualEffectView(effect: blurEffect)
        effectView.frame = Frame
        return effectView
    }()
    
    lazy var textButton: UIButton = {
        let button = UIButton(frame: CGRect(x: ScreenWidth / 2 - 120, y: 90, width: 100, height: 100))
        let image = #imageLiteral(resourceName: "Text")
        button.setImage(image, for: .normal)
        return button
    }()
    
    lazy var textLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: ScreenWidth / 2 - 120, y: 190, width: 100, height: 20))
        label.text = "Text"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 22)
        return label
    }()
    
    lazy var quoteButton: UIButton = {
        let button = UIButton(frame: CGRect(x: ScreenWidth / 2 - 120, y: 250, width: 100, height: 100))
        let image = #imageLiteral(resourceName: "Quote")
        button.setImage(image, for: .normal)
        return button
    }()
    
    lazy var quoteLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: ScreenWidth / 2 - 120, y: 350, width: 100, height: 20))
        label.text = "Quote"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 22)
        return label
    }()
    
    lazy var chatButton: UIButton = {
        let button = UIButton(frame: CGRect(x: ScreenWidth / 2 - 120, y: 410, width: 100, height: 100))
        let image = #imageLiteral(resourceName: "Chat")
        button.setImage(image, for: .normal)
        return button
    }()
    
    lazy var chatLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: ScreenWidth / 2 - 120, y: 510, width: 100, height: 20))
        label.text = "Chat"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 22)
        return label
    }()
    
    lazy var photoButton: UIButton = {
        let button = UIButton(frame: CGRect(x: ScreenWidth / 2 + 20, y: 90, width: 100, height: 100))
        let image = #imageLiteral(resourceName: "Photo")
        button.setImage(image, for: .normal)
        return button
    }()
    
    lazy var photoLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: ScreenWidth / 2 + 20, y: 190, width: 100, height: 20))
        label.text = "Photo"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 22)
        return label
    }()
    
    lazy var linkButton: UIButton = {
        let button = UIButton(frame: CGRect(x: ScreenWidth / 2 + 20, y: 250, width: 100, height: 100))
        let image = #imageLiteral(resourceName: "Link")
        button.setImage(image, for: .normal)
        return button
    }()
    
    lazy var linkLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: ScreenWidth / 2 + 20, y: 350, width: 100, height: 20))
        label.text = "Link"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 22)
        return label
    }()
    
    lazy var audioButton: UIButton = {
        let button = UIButton(frame: CGRect(x: ScreenWidth / 2 + 20, y: 410, width: 100, height: 100))
        let image = #imageLiteral(resourceName: "Audio")
        button.setImage(image, for: .normal)
        return button
    }()
    
    lazy var audioLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: ScreenWidth / 2 + 20, y: 510, width: 100, height: 20))
        label.text = "Audio"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 22)
        return label
    }()
    
    lazy var dismissButton: UIButton = {
        let button = UIButton(frame: CGRect(x: ScreenWidth / 2 - 100, y: ScreenHeight - 200, width: 200, height: 50))
        button.setTitle("Dismiss", for: UIControl.State.normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 28)
        button.addTarget(self, action: #selector(tapToDimiss), for: .touchUpInside)
        return button
    }()
    
    
    func setupView() {
        view.addSubview(effectView)
        view.addSubview(textButton)
        view.addSubview(textLabel)
        view.addSubview(quoteButton)
        view.addSubview(quoteLabel)
        view.addSubview(chatButton)
        view.addSubview(chatLabel)
        view.addSubview(photoButton)
        view.addSubview(photoLabel)
        view.addSubview(linkButton)
        view.addSubview(linkLabel)
        view.addSubview(audioButton)
        view.addSubview(audioLabel)
        view.addSubview(dismissButton)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        // Do any additional setup after loading the view.
    }
    
    @objc func tapToDimiss() {
        dismiss(animated: true, completion: nil)
    }

}
