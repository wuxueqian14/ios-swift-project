//
//  ViewController.swift
//  Project 16 - Tumblr Menu
//
//  Created by Ryan on 2020/2/3.
//  Copyright © 2020 Ryan. All rights reserved.
//

import UIKit

let Frame = UIScreen.main.bounds
let ScreenWidth = Frame.width
let ScreenHeight = Frame.height

class ViewController: UIViewController {
    
    fileprivate let id = "reusedCell"
    
    lazy var backImageView: UIImageView = {
        let imageView = UIImageView(frame: Frame)
        let image = #imageLiteral(resourceName: "background")
        imageView.image = image
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    lazy var button: UIButton = {
        let button = UIButton(frame: CGRect(x: ScreenWidth / 2 - 40, y: ScreenHeight - 80, width: 80, height: 80))
        button.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
        return button
    }()
    
    @objc func tapButton() {
        let toVC = MenuViewController()
        toVC.modalPresentationStyle = .custom
        toVC.transitioningDelegate = self
        present(toVC, animated: true, completion: nil)
    }
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: ScreenHeight - 100))
        tableView.backgroundColor = .clear
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CustomCell.classForCoder(), forCellReuseIdentifier: id)
        return tableView
    }()
    
    func setupView() {
        view.addSubview(backImageView)
        view.addSubview(button)
        view.addSubview(tableView)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        // Do any additional setup after loading the view.
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

extension ViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        guard let _ = presenting as? ViewController, let _ = presented as? MenuViewController else {
            return nil
        }
        return PresentAnimationController()
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        guard let _ = dismissed as? MenuViewController else {
            return nil
        }
        return DismissAnimationController()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: id, for: indexPath) as! CustomCell
        if indexPath.row == 0 {
            cell.leftTopImageView.image = #imageLiteral(resourceName: "hugo")
            cell.nameLabel.text = "Bean"
            cell.backImageView.image = #imageLiteral(resourceName: "2")
        } else {
            cell.leftTopImageView.image = #imageLiteral(resourceName: "mengto")
            cell.nameLabel.text = "Kran"
            cell.backImageView.image = #imageLiteral(resourceName: "1")
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
}
