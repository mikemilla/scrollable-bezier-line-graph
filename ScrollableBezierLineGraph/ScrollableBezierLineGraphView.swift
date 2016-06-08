//
//  ScrollableBezierLineGraphView.swift
//  ScrollableBezierLineGraph
//
//  Created by Michael Miller on 6/6/16.
//  Copyright © 2016 mikemilla. All rights reserved.
//

import UIKit

class ScrollableBezierLineGraphView: UIView, UICollectionViewDelegate, UICollectionViewDataSource {
    
    // Static
    private var collectionView:UICollectionView!
    private let GraphCell:String = "GraphCell"
    
    // Dynamic
    private var values:[CGFloat] = []
    private var showScrollbar:Bool = false  // Defalt Value
    private var bouncesEnabled:Bool = false // Default Value
    private var cellWidth:CGFloat = 48      // Default Value
    
    // MARK: Init
    convenience init() {
        self.init(frame: CGRectZero)
        // nil
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        // view
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        // xib raw
    }
    
    // Initialize the view after we can use it's full size
    override var bounds: CGRect {
        didSet {
            initialize(bounds)
        }
    }
    
    // MARK: Setters
    func setCellWidth(cellWidth: CGFloat) {
        self.cellWidth = cellWidth
        self.reloadGraph()
    }
    
    func setValues(values:[CGFloat]) {
        self.values = values
        self.reloadGraph()
    }
    
    func setShowScrollBar(show: Bool) {
        
        // Set the value of the class
        showScrollbar = show
        
        // Make the change to the CollectionView
        if let collectionView = self.collectionView {
            collectionView.showsHorizontalScrollIndicator = show
        }
    }
    
    func setScrollBouncesEnabled(enabled: Bool) {
        
        // Set the value of the class
        bouncesEnabled = enabled
        
        // Make the change to the CollectionView
        if let collectionView = self.collectionView {
            collectionView.bounces = enabled
        }
    }
    
    // MARK: Loaders
    private func reloadGraph() {
        if let collectionView = self.collectionView {
            collectionView.reloadData()
        }
    }
    
    // Setup the subviews
    func initialize(bounds: CGRect) {
        
        // CollectionView Flow Layout
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .Horizontal
        flowLayout.minimumInteritemSpacing = 0;
        flowLayout.minimumLineSpacing = 0;
        
        // CollectionView
        collectionView = UICollectionView(frame: CGRectMake(0, 0, bounds.width, bounds.height), collectionViewLayout: flowLayout)
        collectionView.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: GraphCell)
        collectionView.showsHorizontalScrollIndicator = showScrollbar
        collectionView.bounces = bouncesEnabled
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.clearColor()
        
        // Remove all subviews
        // Allows screen rotation to work properly
        subviews.forEach {
            $0.removeFromSuperview()
        }
        
        // Add the CollectionView as a subview
        addSubview(collectionView)
    }
    
    
    // MARK: CollectionView
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return values.count
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSize(width: cellWidth, height: bounds.height)
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(GraphCell, forIndexPath: indexPath)
        cell.backgroundColor = UIColor.greenColor()
        return cell
    }

}
