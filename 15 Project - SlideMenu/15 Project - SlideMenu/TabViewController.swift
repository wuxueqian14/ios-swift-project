//
//  TabViewController.swift
//  15 Project - SlideMenu
//
//  Created by Ryan on 2020/1/31.
//  Copyright © 2020 Ryan. All rights reserved.
//

import UIKit

class TabViewController: UIViewController {
    
    fileprivate let id = "menuCell"
    
    var menuItems = ["Everyday Moments", "Popular", "Editors", "Upcoming", "Fresh", "Stock-photos", "Trending"]
    var currentItemIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        // Do any additional setup after loading the view.
    }
    
    func setupView() {
        self.view.frame = CGRect(x: 0, y: 0, width: ScreenWidth, height: ScreenHeight - 200)
        self.view.backgroundColor = UIColor(red:0.109, green:0.114, blue:0.128, alpha:1)
        self.view.addSubview(tableView)

    }
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: self.view.frame)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.register(MenuTableViewCell.classForCoder(), forCellReuseIdentifier: id)
        return tableView
    }()
    
    @objc func Dismiss() {
        dismiss(animated: true, completion: nil)
    }
}

extension TabViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: id, for: indexPath) as! MenuTableViewCell
        cell.headLabel.text = menuItems[indexPath.row]
        cell.headLabel.textColor = (currentItemIndex == indexPath.row) ? UIColor.white : UIColor.gray
        cell.backgroundColor = UIColor.clear
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        currentItemIndex = indexPath.row
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
