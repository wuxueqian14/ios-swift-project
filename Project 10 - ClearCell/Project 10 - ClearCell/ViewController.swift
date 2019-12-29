//
//  ViewController.swift
//  Project 10 - ClearCell
//
//  Created by Ryan on 2019/12/28.
//  Copyright © 2019 Ryan. All rights reserved.
//

import UIKit

let frame = UIScreen.main.bounds

class ViewController: UIViewController {
    
    let id = "reusedCell"
    
    let data = ["Read 3 article on Medium", "Cleanup bedroom", "Go for a run", "Hit the gym", "Build another swift project", "Movement training", "Fix the layout problem of a client project", "Write the experience of #30daysSwift", "Inbox Zero", "Booking the ticket to Chengdu", "Test the Adobe Project Comet", "Hop on a call to mom"]
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: CGRect(x: 0, y: 85, width: frame.width, height: frame.height))
        tableView.backgroundColor = .black
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(ClearTableViewCell.classForCoder(), forCellReuseIdentifier: id)
        tableView.separatorStyle = .none
        return tableView
    }()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func setupView() {
        self.title = "Personal List"
        //导航栏背景黑色
        self.navigationController?.navigationBar.barStyle = .black
        //导航栏字体
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        self.view.addSubview(tableView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        // Do any additional setup after loading the view.
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func colorForIndex(row: Int) -> UIColor {
        let count = data.count - 1
        let color = CGFloat(row) / CGFloat(count) * 0.6
        return UIColor(red: 0.0, green: color, blue: 1.0, alpha: 1.0)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: id, for: indexPath) as! ClearTableViewCell     //cell内部渐变
        cell.textLabel?.text = data[indexPath.row]
        cell.textLabel?.textColor = UIColor.white
        cell.textLabel?.backgroundColor = UIColor.clear
        cell.textLabel?.font = UIFont(name: "Avenir Next", size: 18)
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = colorForIndex(row: indexPath.row)
    }
}
