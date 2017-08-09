//
//  BarCell.swift
//  Graph
//
//  Created by Jordan.Dixon on 20/07/2017.
//  Copyright © 2017 Jordan Dixon. All rights reserved.
//

import UIKit

class BarCell: UICollectionViewCell {
    
    static let reuseID = "BarCell"
    
    let barView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 5
        return view
    }()
    
    var barTintColor: UIColor? {
        didSet {
            barView.backgroundColor = barTintColor
        }
    }
    
    func setBarHeight(to newHeight: CGFloat) {
        barHeightConstraint?.constant = newHeight
    }
    
    private var barHeightConstraint: NSLayoutConstraint?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(barView)
        
        barHeightConstraint = barView.heightAnchor.constraint(equalToConstant: 300)
        barHeightConstraint?.isActive = true
        barHeightConstraint?.constant = 100
        
        NSLayoutConstraint.activate([
            barView.bottomAnchor.constraint(equalTo: bottomAnchor),
            barView.rightAnchor.constraint(equalTo: rightAnchor),
            barView.leftAnchor.constraint(equalTo: leftAnchor)
            ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
}
