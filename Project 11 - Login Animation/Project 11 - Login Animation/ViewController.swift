//
//  ViewController.swift
//  Project 11 - Login Animation
//
//  Created by 吴学谦 on 2019/12/31.
//  Copyright © 2019 Ryan.com. All rights reserved.
//
import UIKit

let frame = UIScreen.main.bounds
let ScreenWidth = frame.width
let ScreenHeight = frame.height

class ViewController: UIViewController {
    
    lazy var headerView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: ScreenWidth / 2 - 120, y: 80, width: 240, height: 70))
        imageView.image = UIImage(named: "login-secondary-logo")
        return imageView
    }()
    
    lazy var signButton: UIButton = {
        let button = UIButton(type: UIButton.ButtonType.system)
        button.frame = CGRect(x: ScreenWidth / 2 - 160, y: ScreenHeight * 3 / 4, width: 320, height: 50)
        button.backgroundColor = .white
        button.setTitle("Sign up", for: .normal)
        button.layer.cornerRadius = 5
        button.setTitleColor(.systemGreen, for: .normal)
        return button
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton(type: UIButton.ButtonType.system)
        button.frame = CGRect(x: ScreenWidth / 2 - 160, y: ScreenHeight * 3 / 4 + 80, width: 320, height: 50)
        button.backgroundColor = UIColor(red: 34 / 255, green: 139 / 255, blue: 34 / 255, alpha: 1.0)
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(clickLoginButton), for: .touchUpInside)
        return button
    }()
    
    @objc func clickLoginButton() {
        present(LoginViewController(), animated: true, completion: nil)
    }
    
    func setupView() {
        self.view.addSubview(headerView)
        self.view.addSubview(signButton)
        self.view.addSubview(loginButton)
    }

    override func viewDidLoad() {
        self.view.backgroundColor = .systemGreen
        super.viewDidLoad()
        setupView()
        // Do any additional setup after loading the view.
    }

}

