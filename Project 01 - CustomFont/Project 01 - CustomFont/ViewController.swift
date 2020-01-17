//
//  ViewController.swift
//  Project 01 - CustomFont
//
//  Created by 吴学谦 on 2019/12/10.
//  Copyright © 2019 Ryan.com. All rights reserved.
//

import UIKit

let ScreenWidth = UIScreen.main.bounds.width
let ScreenHeight = UIScreen.main.bounds.height

class ViewController: UIViewController {
    
    static let identify = "reusedCell"
    
    static let data = ["A view that presents data using rows arranged in a single column.", "Table views on iOS display a single column of vertically scrolling content, divided into rows.", "Each row in the table contains one piece of your app’s content. ", "For example, the Contacts app displays the name of each contact in a separate row, and the main page of the Settings app displays the available groups of settings. ", "You can configure a table to display a single long list of rows, or you can group related rows into sections to make navigating the content easier."]
    
    static let fonts = [
    "AppleSDGothicNeo-Thin",
    "GillSans-UltraBold",
    "CourierNewPS-ItalicMT",
    "KohinoorTelugu-Medium"]
    
    static var fontIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        获取字体族和字体名字
//        for family in UIFont.familyNames {
//            print("family : \(family)")
//            for font in UIFont.fontNames(forFamilyName: family) {
//                print(font)
//            }
//        }
        
        setupView()
        // Do any additional setup after loading the view.
    }

    func setupView()
    {
        self.title = "Custom Font"
        self.view.backgroundColor = .white
        self.view.addSubview(tableView)
        self.view.addSubview(button)
    }
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: 500))
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: ViewController.self.identify)
        return tableView
    }()
    
    lazy var button: UIButton = {
        let button = UIButton(frame: CGRect(x: ScreenWidth / 2 - 30, y: 700, width: 60, height: 60))
        button.setTitle("Click", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 20
        button.layer.shadowOffset = CGSize(width: 5, height: 5)
        button.layer.borderColor = UIColor.systemPurple.cgColor
        button.backgroundColor = .orange
        button.addTarget(self, action: #selector(clickButton(_:)), for: .touchUpInside)
        return button
    }()
    
    @objc func clickButton(_ sender: UIButton) {
        ViewController.fontIndex = (ViewController.fontIndex + 1) % ViewController.fonts.count
        tableView.reloadData()
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ViewController.self.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ViewController.self.identify, for: indexPath)
        cell.textLabel?.text = ViewController.self.data[indexPath.row]
        cell.textLabel?.textColor = .black
        cell.selectionStyle = .none
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.textAlignment = .left
        cell.textLabel?.font = UIFont.init(name: ViewController.fonts[ViewController.fontIndex], size: 16)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(80)
    }
    
}
