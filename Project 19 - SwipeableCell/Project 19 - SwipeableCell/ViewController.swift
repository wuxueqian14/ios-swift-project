//
//  ViewController.swift
//  Project 19 - SwipeableCell
//
//  Created by Ryan on 2020/2/8.
//  Copyright © 2020 Ryan. All rights reserved.
//

import UIKit

let Frame = UIScreen.main.bounds
let ScreenWidth = Frame.width
let ScreenHeight = Frame.height

class ViewController: UIViewController {
    
    private var data = [
        Pattern(image: "1", name: "Pattern Building"),
        Pattern(image: "2", name: "Joe Beez"),
        Pattern(image: "3", name: "Car It's car"),
        Pattern(image: "4", name: "Floral Kaleidoscopic"),
        Pattern(image: "5", name: "Sprinkle Pattern"),
        Pattern(image: "6", name: "Palitos de queso"),
        Pattern(image: "7", name: "Ready to Go? Pattern"),
        Pattern(image: "8", name: "Sets Seamless"),
    ]
    
    private let id = "reusedCell"
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: CGRect(x: 0, y: 88, width: ScreenWidth, height: ScreenHeight-88))
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CustomCell.classForCoder(), forCellReuseIdentifier: id)
        return tableView
    }()
    
    func setupView() {
        title = "Swipeable Cell"
        view.addSubview(tableView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
        /*
        viewWillAppear
        视图加载到内存之后调用,需要tableview更新才能产生动画效果
        */
        let cells = tableView.visibleCells
        for (index, cell) in cells.enumerated() {
            cell.frame.origin.y = ScreenHeight
            //动画为从下到上的弹性动画
            UIView.animate(withDuration: 1.0, delay: 0.1 * Double(index), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                cell.frame.origin.y = 0
            }, completion: nil)
        }
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: id, for: indexPath) as! CustomCell
        cell.leftImageView.image = UIImage(named: data[indexPath.row].image)
        cell.rightLabel.text = data[indexPath.row].name
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            data.remove(at: indexPath.row)
            tableView.reloadData()
            //follow method has bug.
            //tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.none)
        } else {
            print("insert")
        }
    }
}
