//
//  ViewController.swift
//  Project 04 - Carousel Effect
//
//  Created by Ryan on 2020/1/18.
//  Copyright © 2020 Ryan. All rights reserved.
//

import UIKit
let frame = UIScreen.main.bounds
let ScreenWidth = frame.width
let ScreenHeight = frame.height

class ViewController: UIViewController {
    
    fileprivate let id = "reusedCell"
    
    let data = Model.creatModelArray()
    
    lazy var backImgView: UIImageView = {
        let imageView = UIImageView(frame: frame)
        let image = #imageLiteral(resourceName: "blue")
        imageView.contentMode = .scaleAspectFit
        imageView.image = image
        return imageView
    }()
    
    lazy var effectView: UIVisualEffectView = {
        let effect = UIBlurEffect(style: UIBlurEffect.Style.light)
        let effectView = UIVisualEffectView(effect: effect)
        effectView.frame = frame
        return effectView
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: CGRect(x: ScreenWidth / 2 - 195, y: ScreenHeight / 2 - 220, width: 390, height: 440), collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CustomCell.classForCoder(), forCellWithReuseIdentifier: id)
        return collectionView
    }()

    func setupView() {
        self.view.addSubview(backImgView)
        self.view.addSubview(effectView)
        self.view.addSubview(collectionView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        // Do any additional setup after loading the view.
    }


}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
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
        return CGSize(width: 390, height: 420)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
}

extension ViewController: UIScrollViewDelegate {
    //Tells the delegate when the user finishes scrolling the content.
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let originPoint = targetContentOffset.pointee
        var index = Int(originPoint.x / ScreenWidth)
        let offset = Int(originPoint.x) % Int(ScreenWidth)
        index += (offset > Int(ScreenWidth/2)) ? 1 : 0
        targetContentOffset.pointee = CGPoint(x: index * Int(ScreenWidth), y: 0)
    }
}
