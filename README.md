# iOS Swift Project

In github, i found a wonderful project --- [30DaysofSwift Project](https://github.com/allenwong/30DaysofSwift).

Unfortunately for me, i don't like StoryBoard.The project is not all built with code. The structure of StoryBoard confused me when I was studying, so I followed his project to refactor and add my own elements.

## Development environment

Xcode Version 11.3 (11C29) And Swift 5.0

Because i don't like StoryBoard，so I removed Main.storyboard from the file and in Info.plist modify related options.

![](resource/cover.png)
## 01 CustomFont

- understand UIApplication, UIViewController, UIView all inherit from NSObject
- UIWindow is the main window for App.
- know UIFont.familyNames and fontNames(forFamilyName: family)
- learn addTarget method (object connect with communicate event)
- using UITableViewDataSource, UITableViewDelegate protocols and their methods.

![](resource/1.gif)

## 02 Stop Watch
- learn willSet and didSet property observer
- review addTarget method
- Timer method scheduledTimer() and invalidate()

![](resource/2.gif)

## 03 Local Video
- learn AVPlayer and AVPlayerViewController
- learn present method to push ViewController (diffrent from UINavigationController.pushViewController)
- learn customize UITableViewCell

![](resource/3.gif)

## 04 Carousel Effect
- learn UICollectionView and customize UICollectionViewCell
- use UIVisualEffectView 
- know protocol UICollectionViewDelegateFlowLayout and UIScrollViewDelegate

![](resource/4.gif)


## 05 Find Position
- learn import CoreLocation and use instance of CLLocationManager
- know about CLLocationManagerDelegate protocol
- CLLocation convert CLGeocoder

![](resource/5.png)

## 06 PushToRefresh
- learn UIRefreshControl
- learn append data and reload tableView
- use NSAttributedString to change text style

![](resource/6.gif)

## 07 Random Color Gradient
- learn AVAudioPlayer import from AVFoundation 
- use gradientLayer and drand48()

![](resource/7.gif)

## 08 ImageScroller
- learn UIScrollView
- learn UIScrollViewDelegate (use viewForZooming method and minimumZoomScale, maximumZoomScale)

![](resource/8.gif)


## 09 VideoBackground
- view.layer.addSubLayer(AVPlayerLayer)
- learn NotificationCenter and register observers
- know about AVPlayerItem and AVPlayerLayer

![](resource/9.gif)

## 10 ClearCell
- review CAGradientLayer and UITableView
- set navifationBar.barStyle and navigationBar.titleTextAttributes

![](resource/10.gif)

## 11 Login Animation
- study UIView.animate 
- learn about present and dismiss method

![](resource/11.gif)


## 12 Animate TableViewCell
- review animate and connect tableViewCell
- review Clear style about Cell

![](resource/12.gif)

## 13 Emoji Slot Machine
- study UIPickerView and UIPickerViewDataSource UIPickerViewDelegate

![](resource/13.gif =300*500)
