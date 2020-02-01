//
//  ViewController.swift
//  15 Project - SlideMenu
//
//  Created by Ryan on 2020/1/24.
//  Copyright © 2020 Ryan. All rights reserved.
//

import UIKit

let Frame = UIScreen.main.bounds
let ScreenWidth = Frame.width
let ScreenHeight = Frame.height

class ViewController: UIViewController {
    
    let id = "reusedCell"
    
    func setupView() {
        self.view.backgroundColor = .black
        self.navigationController?.navigationBar.barStyle = .black
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
       // self.navigationController?.navigationItem.leftBarButtonItem = leftbarButtonItem
        self.navigationItem.leftBarButtonItem = leftbarButtonItem
        self.navigationItem.title = "Everyday Moments"
        self.view.addSubview(tableView)
    }
    
    lazy var leftbarButtonItem: UIBarButtonItem = {
        let image = #imageLiteral(resourceName: "menu")
        let buttonItem = UIBarButtonItem(image: image, style: UIBarButtonItem.Style.plain, target: self, action: #selector(clickLeftBarButton))
        return buttonItem
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: CGRect(x: 0, y: 88, width: ScreenWidth, height: ScreenHeight - 88))
        tableView.register(MainCell.classForCoder(), forCellReuseIdentifier: id)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .clear
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        // Do any additional setup after loading the view.
    }
    
    let animationController = AnimationController()
    
    @objc func clickLeftBarButton() {
        let tabViewController = TabViewController()
        tabViewController.transitioningDelegate = animationController
        animationController.delegate = self
        present(tabViewController, animated: true, completion: nil)
    }

}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: id, for: indexPath) as! MainCell
        cell.backgroundColor = .clear
        if indexPath.row == 0 {
            cell.backImageView.image = UIImage(named: "1")
            cell.titleLabel.text = "Love mountain."
            cell.authorLabel.text = "Allen Wang"
            cell.authorImageView.image = UIImage(named: "a")
            
        } else if indexPath.row == 1 {
            cell.backImageView.image = UIImage(named: "2")
            cell.titleLabel.text = "New graphic design - LIVE FREE"
            cell.authorLabel.text = "Cole"
            cell.authorImageView.image = UIImage(named: "b")
            
        } else if indexPath.row == 2 {
            cell.backImageView.image = UIImage(named: "3")
            cell.titleLabel.text = "Summer sand"
            cell.authorLabel.text = "Daniel Hooper"
            cell.authorImageView.image = UIImage(named: "c")
            
        } else {
            cell.backImageView.image = UIImage(named: "4")
            cell.titleLabel.text = "Seeking for signal"
            cell.authorLabel.text = "Noby-Wan Kenobi"
            cell.authorImageView.image = UIImage(named: "d")
            
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 240
    }
}

extension ViewController: AnimationDelegate {
    func dismiss() {
        dismiss(animated: true, completion: nil)
    }
}
