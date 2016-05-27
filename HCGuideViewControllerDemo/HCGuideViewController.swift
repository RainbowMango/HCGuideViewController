//
//  ViewController.swift
//  HCGuideViewControllerDemo
//
//  Created by ruby on 16/5/27.
//  Copyright © 2016年 ruby. All rights reserved.
//
//  GitHub地址:https://github.com/RainbowMango/HCGuideViewController

import UIKit

public let ScreenBounds: CGRect  = UIScreen.mainScreen().bounds
public let ScreenWidth: CGFloat  = UIScreen.mainScreen().bounds.size.width
public let ScreenHeight: CGFloat = UIScreen.mainScreen().bounds.size.height
public let HCGuideViewControllerDidFinish = "HCGuideViewControllerDidFinish"

public class HCGuideViewController: UIViewController {
    
    private var collectionView: UICollectionView?
    public var imageNames     : Array<String>!
    private let cellIdentifier = "GuideCell"
    private var isHiddenNextButton = true
    private var pageController = UIPageControl(frame: CGRectMake(0, ScreenHeight - 50, ScreenWidth, 20))
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        buildCollectionView()
        
        buildPageController()
    }
    
    // MARK: - Build UI
    private func buildCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.itemSize = ScreenBounds.size
        layout.scrollDirection = UICollectionViewScrollDirection.Horizontal
        
        collectionView = UICollectionView(frame: ScreenBounds, collectionViewLayout: layout)
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.showsHorizontalScrollIndicator = false
        collectionView?.showsVerticalScrollIndicator = false
        collectionView?.pagingEnabled = true
        collectionView?.bounces = false
        collectionView?.registerClass(GuideCell.self, forCellWithReuseIdentifier: cellIdentifier)
        view.addSubview(collectionView!)
    }
    
    private func buildPageController() {
        pageController.numberOfPages = imageNames.count
        pageController.currentPage = 0
        view.addSubview(pageController)
    }
}

public func prefersStatusBarHidden() -> Bool {
    return false
}

extension HCGuideViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    public func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return imageNames.count
    }
    
    public func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(cellIdentifier, forIndexPath: indexPath) as! GuideCell
        cell.newImage = UIImage(named: imageNames[indexPath.row])
        if indexPath.row != imageNames.count - 1 {
            cell.setNextButtonHidden(true)
        }
        
        return cell
    }
    
    public func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        if scrollView.contentOffset.x == ScreenWidth * CGFloat(imageNames.count - 1) {
            let cell = collectionView!.cellForItemAtIndexPath(NSIndexPath(forRow: imageNames.count - 1, inSection: 0)) as! GuideCell
            cell.setNextButtonHidden(false)
            isHiddenNextButton = false
        }
    }
    
    public func scrollViewDidScroll(scrollView: UIScrollView) {
        if scrollView.contentOffset.x != ScreenWidth * CGFloat(imageNames.count - 1) && !isHiddenNextButton && scrollView.contentOffset.x > ScreenWidth * CGFloat(imageNames.count - 2) {
            let cell = collectionView!.cellForItemAtIndexPath(NSIndexPath(forRow: imageNames.count - 1, inSection: 0)) as! GuideCell
            cell.setNextButtonHidden(true)
            isHiddenNextButton = true
        }
        
        pageController.currentPage = Int(scrollView.contentOffset.x / ScreenWidth + 0.5)
    }
}
