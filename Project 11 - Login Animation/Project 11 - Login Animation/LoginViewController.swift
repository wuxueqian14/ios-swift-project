//
//  LoginViewController.swift
//  Project 11 - Login Animation
//
//  Created by 吴学谦 on 2019/12/31.
//  Copyright © 2019 Ryan.com. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    lazy var titleLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: ScreenWidth / 2 - 75, y: 50, width: 150, height: 50))
        label.text = "Welcome"
        label.textAlignment = .center
        label.font = UIFont.init(name: "Avenir Next Regular", size: 25)
        label.textColor = .white
        return label
    }()
    
    lazy var leftButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 50, width: 50, height: 50))
        button.setImage(UIImage(named: "Back-icon"), for: .normal)
        button.addTarget(self, action: #selector(clickLeftButton), for: .touchUpInside)
        return button
    }()
    
    lazy var userNameTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: ScreenWidth / 2 - 150, y: 200, width: 300, height: 50))
        textField.layer.cornerRadius = 5
        textField.attributedPlaceholder = NSAttributedString(string: "username")
        textField.backgroundColor = .white
        return textField
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: ScreenWidth / 2 - 150, y: 280, width: 300, height: 50))
        textField.attributedPlaceholder = NSAttributedString(string: "password")
        textField.layer.cornerRadius = 5
        textField.backgroundColor = .white
        return textField
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton(frame: CGRect(x: ScreenWidth / 2 - 75, y: 360, width: 150, height: 40))
        button.backgroundColor = UIColor(red: 34 / 255, green: 139 / 255, blue: 34 / 255, alpha: 1.0)
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(clickLoginButton), for: .touchUpInside)
        return button
    }()
    
    @objc func clickLeftButton() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func clickLoginButton() {
        
        UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options: UIView.AnimationOptions.curveEaseOut, animations: {
            self.loginButton.frame = CGRect(x: ScreenWidth / 2 - 75 - 20, y: 360, width: 150 + 40, height: 40)
        }) { (finished) in
            self.loginButton.frame = CGRect(x: ScreenWidth / 2 - 75, y: 360, width: 150, height: 40)
        }
    }
    
    func setupView() {
        self.view.backgroundColor = .systemGreen
        self.view.addSubview(titleLabel)
        self.view.addSubview(leftButton)
        self.view.addSubview(userNameTextField)
        self.view.addSubview(passwordTextField)
        self.view.addSubview(loginButton)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.userNameTextField.center.x = -200
        self.passwordTextField.center.x = -200
        self.loginButton.center.x = -200
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        UIView.animate(withDuration: 0.5, delay: 0.00, options: UIView.AnimationOptions.curveEaseInOut, animations: {
                self.userNameTextField.center.x = ScreenWidth / 2
            }, completion: nil)
            
            UIView.animate(withDuration: 0.5, delay: 0.10, options: UIView.AnimationOptions.curveEaseInOut, animations: {
                self.passwordTextField.center.x = ScreenWidth / 2
            }, completion: nil)
        
            UIView.animate(withDuration: 0.5, delay: 0.20, options: UIView.AnimationOptions.curveEaseInOut, animations: {
                self.loginButton.center.x = ScreenWidth / 2
            }, completion: nil)
    }
    
}
