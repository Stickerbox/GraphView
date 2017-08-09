//
//  GraphView.swift
//  Graph
//
//  Created by Jordan.Dixon on 20/07/2017.
//  Copyright © 2017 Jordan Dixon. All rights reserved.
//

import UIKit

class GraphView: UIView, NibInflatable {
    
    @IBOutlet var container: UIView!
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var maxXValue: UILabel!
    @IBOutlet weak var graphNameLabel: UILabel!
    
    fileprivate var barWidth: CGFloat = 10
    private var minimumBarWidth: CGFloat = 10
    
    var values: [CGFloat]? {
        didSet {
            collectionView.reloadData()
            updateView()
        }
    }
    
    var graphName: String? {
        didSet {
            updateView()
        }
    }
    
    var graphLabelTintColor: UIColor? {
        didSet {
            updateView()
            
        }
    }
    
    var barTintColor: UIColor? {
        didSet {
            collectionView.reloadData()
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }

    private func setupView() {
        initializeSubviews()
        collectionView.register(BarCell.self, forCellWithReuseIdentifier: BarCell.reuseID)
        
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(viewPinched(_:)))
        collectionView.addGestureRecognizer(pinchGesture)
        updateView()
    }
    
    private func updateView() {
        graphNameLabel.text = graphName
        graphNameLabel.textColor = graphLabelTintColor
        maxXValue.textColor = graphLabelTintColor
        
        guard let max = values?.max() else { return }
        maxXValue.text = "\(max)"
    }
    
    func viewPinched(_ recognizer: UIPinchGestureRecognizer) {
        
        if recognizer.velocity > 0 {
            barWidth = barWidth + recognizer.scale * 2
        } else {
            barWidth = barWidth - recognizer.scale * 2
        }
        
        if barWidth < minimumBarWidth { barWidth = minimumBarWidth }
        
        collectionView.reloadData()
    }
    
}

extension GraphView: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return values?.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BarCell.reuseID, for: indexPath) as! BarCell

        if let max = values?.max(), let value = values?[indexPath.item] {
            
            let ratio = value / max
            
            cell.setBarHeight(to: collectionView.frame.height * ratio)
        }
        
        cell.barTintColor = barTintColor
        
        return cell
    }
}

extension GraphView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: barWidth, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 4
    }
}
