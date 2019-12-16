//
//  ViewController.swift
//  Project 03 - Paly Local Video
//
//  Created by 吴学谦 on 2019/12/16.
//  Copyright © 2019 Ryan.com. All rights reserved.
//

import UIKit
import AVKit

let ScreenWidth = UIScreen.main.bounds.width
let ScreenHeight = UIScreen.main.bounds.height

class ViewController: UIViewController {

    static let id: String = "MovieCell"
    
    var player = AVPlayer()
    let playerViewController = AVPlayerViewController()
    
    var data = [
        Video(image: "videoScreenshot01",
              title: "Introduce 3DS Mario",
              source: "Youtube - 06:32"),
        Video(image: "videoScreenshot02",
              title: "Emoji Among Us",
              source: "Vimeo - 3:34"),
        Video(image: "videoScreenshot03",
              title: "Seals Documentary",
              source: "Vine - 00:06"),
        Video(image: "videoScreenshot04",
              title: "Adventure Time",
              source: "Youtube - 02:39"),
        Video(image: "videoScreenshot05",
              title: "Facebook HQ",
              source: "Facebook - 10:20"),
        Video(image: "videoScreenshot06",
              title: "Lijiang Lugu Lake",
              source: "Allen - 20:30")
    ]
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: UIScreen.main.bounds)
        tableView.backgroundColor = .black
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(MovieCell.self, forCellReuseIdentifier: ViewController.id)
        return tableView
    }()
    
    

    func setupView() {
        self.view.backgroundColor = .black
        self.navigationController?.navigationBar.barStyle = .black
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        self.title = "Watch Layer"
        self.view.addSubview(tableView)
    }
    
    @objc func clickButton() {
        let path = Bundle.main.path(forResource: "emoji zone", ofType: ".mp4")
        player = AVPlayer(url: URL(fileURLWithPath: path!))
        playerViewController.player = player
        
        self.present(playerViewController, animated: true) {
            self.playerViewController.player?.play()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        // Do any additional setup after loading the view.
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ViewController.id, for: indexPath) as! MovieCell
        cell.backImageView.image = UIImage(named: data[indexPath.row].image)
        cell.titleLabel.text = data[indexPath.row].title
        cell.sourceLabel.text = data[indexPath.row].source
        cell.selectionStyle = .none
        cell.button.addTarget(self, action: #selector(clickButton), for: .touchUpInside)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }
    
}
