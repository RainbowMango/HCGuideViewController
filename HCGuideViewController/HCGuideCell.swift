//
//  ViewController.swift
//  HCGuideViewControllerDemo
//
//  Created by ruby on 16/5/27.
//  Copyright © 2016年 ruby. All rights reserved.
//
//  GitHub地址:https://github.com/RainbowMango/HCGuideViewController

import UIKit

class GuideCell: UICollectionViewCell {
    
    private let newImageView = UIImageView(frame: ScreenBounds)
    private let nextButton = UIButton(frame: CGRectMake((ScreenWidth - 100) * 0.5, ScreenHeight - 110, 100, 33))
    
    var newImage: UIImage? {
        didSet {
            newImageView.image = newImage
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        newImageView.contentMode = UIViewContentMode.ScaleAspectFill
        contentView.addSubview(newImageView)
        
        //获取bundle资源
        let bundle = NSBundle.HCGuideViewControllerBundle()
        let imagePath = bundle.pathForResource("icon_next@2x", ofType: "png")
        let image = UIImage(contentsOfFile: imagePath!)
        
        nextButton.setBackgroundImage(image, forState: UIControlState.Normal)
        nextButton.addTarget(self, action: #selector(GuideCell.nextButtonClick), forControlEvents: UIControlEvents.TouchUpInside)
        nextButton.hidden = true
        contentView.addSubview(nextButton)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setNextButtonHidden(hidden: Bool) {
        nextButton.hidden = hidden
    }
    
    func nextButtonClick() {
        NSNotificationCenter.defaultCenter().postNotificationName(HCGuideViewControllerDidFinish, object: nil)
    }
}
