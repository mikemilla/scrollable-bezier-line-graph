//
//  ViewController.swift
//  ScrollableBezierLineGraph
//
//  Created by Michael Miller on 6/6/16.
//  Copyright © 2016 mikemilla. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var graphView: ScrollableBezierLineGraphView!
    
    @IBAction func button(sender: AnyObject) {
        graphView.setValues([45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45])
        graphView.setCellWidth(80)
        graphView.setShowScrollBar(true)
        graphView.setScrollBouncesEnabled(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        graphView.setValues([45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

