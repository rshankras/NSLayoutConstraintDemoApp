//
//  ViewController.swift
//  NSLayoutConstraintDemoApp
//
//  Created by Ravi Shankar on 18/02/16.
//  Copyright © 2016 Ravi Shankar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    private let SCREEN_SIZE = UIScreen.mainScreen().bounds
    private let GAP_BETWEEN_VIEWS:CGFloat = 0.08
    
    // Create four Subviews
    
    var topLeftView = UIView()
    var topRightView = UIView()
    var bottomLeftView = UIView()
    var bottomRightView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.redColor()
        
        addViews()
        addConstraints()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK:- Adding Views
    
    func addViews() {
        
        let heightOfSubView = SCREEN_SIZE.height / 2 - SCREEN_SIZE.height * GAP_BETWEEN_VIEWS/2
        let widthOfSubView = SCREEN_SIZE.width / 2 - SCREEN_SIZE.height * GAP_BETWEEN_VIEWS/2
        
        // Calculate the height and size of each views
        
        topLeftView = UIView(frame: CGRect(x: 0, y: 0, width: widthOfSubView, height: heightOfSubView))
        topRightView = UIView(frame: CGRect(x: widthOfSubView + (SCREEN_SIZE.height * GAP_BETWEEN_VIEWS), y: 0, width: widthOfSubView, height: heightOfSubView))
        bottomLeftView = UIView(frame: CGRect(x: 0, y: heightOfSubView + (SCREEN_SIZE.height * GAP_BETWEEN_VIEWS), width: widthOfSubView, height: heightOfSubView))
        bottomRightView = UIView(frame: CGRect(x: widthOfSubView + (SCREEN_SIZE.height * GAP_BETWEEN_VIEWS), y: heightOfSubView + (SCREEN_SIZE.height * GAP_BETWEEN_VIEWS), width: widthOfSubView, height: heightOfSubView))
        
        topLeftView.backgroundColor = UIColor.whiteColor()
        topRightView.backgroundColor = UIColor.whiteColor()
        bottomLeftView.backgroundColor = UIColor.whiteColor()
        bottomRightView.backgroundColor = UIColor.whiteColor()
        
        view.addSubview(topLeftView)
        view.addSubview(topRightView)
        view.addSubview(bottomLeftView)
        view.addSubview(bottomRightView)
    }
    
    // MARK:- Add Constraints
    
    func addConstraints() {
        addtopLeftViewConstraints()
        addTopRightViewConstraints()
        addBottomLeftViewConstraints()
        addBottomRightViewConstraints()
        addTopBottomConstraints()
        addLeftRightConstraints()
        addEqualWidthConstraints()
        addEqualHeightConstraints()
        disableAutoResizingMasks()
    }
    
    // MARK:- TopLeftView Constraints
    
    func addtopLeftViewConstraints() {
        let topLeftViewLeadingConstraint = NSLayoutConstraint(item: topLeftView, attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal
            , toItem: view, attribute: NSLayoutAttribute.Leading, multiplier: 1, constant: 0)
        
        let topLeftViewTopConstraint = NSLayoutConstraint(item: topLeftView, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal
            , toItem: view, attribute: NSLayoutAttribute.Top, multiplier: 1, constant: 0)
        
        NSLayoutConstraint.activateConstraints([topLeftViewLeadingConstraint, topLeftViewTopConstraint])
    }
    
    // MARK:- TopRightView Constraints
    
    func addTopRightViewConstraints() {
        
        let topRightViewTrailingConstraint = NSLayoutConstraint(item: topRightView, attribute: NSLayoutAttribute.Trailing, relatedBy: NSLayoutRelation.Equal
            , toItem: view, attribute: NSLayoutAttribute.Trailing, multiplier: 1, constant: 0)
        
        let topRightViewTopConstraint = NSLayoutConstraint(item: topRightView, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal
            , toItem: view, attribute: NSLayoutAttribute.Top, multiplier: 1, constant: 0)
        
        NSLayoutConstraint.activateConstraints([topRightViewTrailingConstraint, topRightViewTopConstraint])
    }
    
    // MARK:- BottomLeftView Constraints
    
    func addBottomLeftViewConstraints() {
        
        let bottomLeftViewLeadingConstraint = NSLayoutConstraint(item: bottomLeftView, attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal
            , toItem: view, attribute: NSLayoutAttribute.Leading, multiplier: 1, constant: 0)
        
        let bottomLeftViewBottomConstraint = NSLayoutConstraint(item: bottomLeftView, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal
            , toItem: view, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: 0)
        
        NSLayoutConstraint.activateConstraints([bottomLeftViewLeadingConstraint, bottomLeftViewBottomConstraint])
        
    }
    
    // MARK:- BottomRightView Constraints
    
    func addBottomRightViewConstraints() {
        
        let bottomRightViewTrailingConstraint = NSLayoutConstraint(item: bottomRightView, attribute: NSLayoutAttribute.Trailing, relatedBy: NSLayoutRelation.Equal
            , toItem: view, attribute: NSLayoutAttribute.Trailing, multiplier: 1, constant: 0)
        
        let bottomRightViewBottomConstraint = NSLayoutConstraint(item: bottomRightView, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal
            , toItem: view, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: 0)
        
        NSLayoutConstraint.activateConstraints([bottomRightViewTrailingConstraint, bottomRightViewBottomConstraint])
    }
    
    // MARK:- TopBottom Constraints
    
    func addTopBottomConstraints() {
        let verticalSpacing1 = NSLayoutConstraint(item: bottomLeftView, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: topLeftView, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: (SCREEN_SIZE.height * GAP_BETWEEN_VIEWS))
        
        let verticalSpacing2 = NSLayoutConstraint(item: bottomRightView, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: topRightView, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: (SCREEN_SIZE.height * GAP_BETWEEN_VIEWS))
        
        
        NSLayoutConstraint.activateConstraints([verticalSpacing1, verticalSpacing2])
        
    }
    
    // MARK:- LeftRight Constraints
    
    func addLeftRightConstraints() {
        
        let horizontalSpacing1 = NSLayoutConstraint(item: topRightView, attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal, toItem: topLeftView, attribute: NSLayoutAttribute.Trailing, multiplier: 1, constant: (SCREEN_SIZE.height * GAP_BETWEEN_VIEWS))
        
        let horizontalSpacing2 = NSLayoutConstraint(item: bottomRightView, attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal, toItem: bottomLeftView, attribute: NSLayoutAttribute.Trailing, multiplier: 1, constant: (SCREEN_SIZE.height * GAP_BETWEEN_VIEWS))
        
        NSLayoutConstraint.activateConstraints([horizontalSpacing1, horizontalSpacing2])
        
    }
    
    // MARK:- Equal Width Constraints
    
    func addEqualWidthConstraints() {
        let topRightViewWidth = NSLayoutConstraint(item: topLeftView, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: topRightView, attribute: NSLayoutAttribute.Width, multiplier: 1, constant: 0)
        
        let bottomLeftViewWidth = NSLayoutConstraint(item: topLeftView, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: bottomLeftView, attribute: NSLayoutAttribute.Width, multiplier: 1, constant: 0)
        
        let bottomRightViewWidth = NSLayoutConstraint(item: topLeftView, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: bottomRightView, attribute: NSLayoutAttribute.Width, multiplier: 1, constant: 0)
        
        NSLayoutConstraint.activateConstraints([topRightViewWidth, bottomLeftViewWidth,bottomRightViewWidth ])
    }
    
    
    // MARK:- Equal Height Constraints
    
    func addEqualHeightConstraints() {
        let topRightViewHeight = NSLayoutConstraint(item: topLeftView, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: topRightView, attribute: NSLayoutAttribute.Height, multiplier: 1, constant: 0)
        
        let bottomLeftViewHeight = NSLayoutConstraint(item: topLeftView, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: bottomLeftView, attribute: NSLayoutAttribute.Height, multiplier: 1, constant: 0)
        
        let bottomRightViewHeight = NSLayoutConstraint(item: topLeftView, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: bottomRightView, attribute: NSLayoutAttribute.Height, multiplier: 1, constant: 0)
        
        NSLayoutConstraint.activateConstraints([topRightViewHeight, bottomLeftViewHeight,bottomRightViewHeight ])
    }
    
    // MARK:- disable autoResizingMasks
    
    func disableAutoResizingMasks() {
        topLeftView.translatesAutoresizingMaskIntoConstraints = false
        topRightView.translatesAutoresizingMaskIntoConstraints = false
        bottomLeftView.translatesAutoresizingMaskIntoConstraints = false
        bottomRightView.translatesAutoresizingMaskIntoConstraints = false
    }

}

