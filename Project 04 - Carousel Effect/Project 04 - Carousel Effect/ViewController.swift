//
//  ViewController.swift
//  Project 04 - Carousel Effect
//
//  Created by 吴学谦 on 2019/12/17.
//  Copyright © 2019 Ryan.com. All rights reserved.
//

import UIKit

let frame = UIScreen.main.bounds
let ScreenWidth = frame.width
let ScreenHeight = frame.height

class ViewController: UIViewController {
    
    lazy var effectView : UIVisualEffectView = {
        let effect = UIBlurEffect(style: UIBlurEffect.Style.light)
        let effectView = UIVisualEffectView(effect: effect)
        effectView.frame = frame
        return effectView
    }()
    
    lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: CGRect(x: 20, y: 150, width: ScreenWidth - 40, height: 493), collectionViewLayout: flowLayout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CustomCell.self, forCellWithReuseIdentifier: id)
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    lazy var backImageView: UIImageView = {
        let imageView = UIImageView(frame: frame)
        imageView.image = UIImage(named: "blue")
        return imageView
    }()
    
    fileprivate var data = CellInfo.createInfos()
    
    private let id = "reusedCell"

    func setupView() {
        self.view.backgroundColor = .white
        self.view.addSubview(backImageView)
        self.view.addSubview(effectView)
        self.view.addSubview(collectionView)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        // Do any additional setup after loading the view.
    }


}

extension ViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: id, for: indexPath) as! CustomCell
        cell.info = data[indexPath.row]
        return cell
    }
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: ScreenWidth - 2 * 20, height: 450)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2 * 20
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }
}


extension ViewController: UIScrollViewDelegate {
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let originPoint = targetContentOffset.pointee
        var index = Int(originPoint.x / ScreenWidth)
        let offset = Int(originPoint.x) % Int(ScreenWidth)
        index += (offset > Int(ScreenWidth/2) ? 1 : 0)
        targetContentOffset.pointee = CGPoint(x: index * Int(ScreenWidth), y: 0)
    }
}
