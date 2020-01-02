//
//  ViewController.swift
//  Project 12 - Animate TableViewCell
//
//  Created by Ryan on 2020/1/1.
//  Copyright © 2020 Ryan. All rights reserved.
//

import UIKit

let frame = UIScreen.main.bounds

class ViewController: UIViewController {
    
    var tableData = ["Personal Life", "Buddy Company", "#30 days Swift Project", "Body movement training", "AppKitchen Studio", "Project Read", "Others", "Personal Life", "Buddy Company", "#30 days Swift Project", "Body movement training", "AppKitchen Studio", "Project Read", "Others"]
    
    let id = "firstReusedCell"
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: frame)
        tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: id)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        return tableView
    }()
    
    func setupView() {
        self.view.addSubview(tableView)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        // Do any additional setup after loading the view.
    }
    
    func animateCell() {
        self.tableView.reloadData()
        let height = tableView.frame.height
        let cells = tableView.visibleCells
        for cell in cells {
            cell.transform = CGAffineTransform(translationX: 0, y: height)
        }
        var index = 0
        for cell in cells {
            UIView.animate(withDuration: 1.5, delay: TimeInterval(0.2 * CGFloat(index)), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: UIView.AnimationOptions.curveEaseInOut, animations: {
                cell.transform = CGAffineTransform(translationX: 0, y: 0)
            }, completion: nil)
            index += 1
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        animateCell()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: id, for: indexPath)
        cell.textLabel?.text = tableData[indexPath.row]
        cell.textLabel?.textColor = UIColor.white
        cell.textLabel?.backgroundColor = UIColor.clear
        cell.textLabel?.font = UIFont(name: "Avenir Next", size: 18)
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        return cell
    }
    func getColor(index: Int) -> UIColor {
        let itemCount = tableData.count - 1
        let color = CGFloat(index) / CGFloat(itemCount) * 0.6
        return UIColor(red: color, green: 0.0, blue: 1.0, alpha: 1.0)
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = getColor(index: indexPath.row)
    }
}
