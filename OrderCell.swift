//
//  OrderCell.swift
//  MiniOrder
//
//  Created by Dylan Carlyle on 13/07/23.
//  Copyright © 2023 SmudgeApps. All rights reserved.
//

import UIKit

class OrderCell: UICollectionViewCell {
    

    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    
    private let orderService = OrderService()

    var quantity: Int = 0 {
        didSet {
            updateLabel()
        }
    }
    
    private func updateLabel() {
        quantityLabel.text = "\(quantity)"
    }
    
    
}
