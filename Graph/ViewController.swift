//
//  ViewController.swift
//  Graph
//
//  Created by Jordan.Dixon on 20/07/2017.
//  Copyright © 2017 Jordan Dixon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var graphView: GraphView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        graphView.values = [100, 200, 300, 450, 800, 340, 920, 23, 195, 356, 129, 285, 185, 290, 192, 13, 529, 49, 90, 19, 38, 58, 192, 490, 184, 239, 904, 283, 194, 832, 184, 284]
        graphView.graphName = "The Best Graph"
        graphView.graphLabelTintColor = .darkGray
        graphView.barTintColor = .orange
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

