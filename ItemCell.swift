//
//  ItemCell.swift
//  MiniOrder
//
//  Created by Dylan Carlyle on 11/07/23.
//  Copyright © 2023 SmudgeApps. All rights reserved.
//

import UIKit

protocol ItemCellDelegate: AnyObject {
    func didUpdateQuantity(_ id: Int, _ quantity: Int, _ index: Int)
}

class ItemCell: UICollectionViewCell {
    @IBOutlet weak var label: UILabel?
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var increaseOrderQuantity: UIButton!
    @IBOutlet var decreaseOrderQuantity: UIButton!
    @IBOutlet weak var orderQuantityLabel: UILabel?
    
    weak var itemCellDelegate : ItemCellDelegate?
    private let orderService = OrderService()
    var id = 0
    var index = 0
    
    var quantity: Int = 0 {
        didSet {
            quantityUpdate()
        }
    }
    
    @IBAction private func increaseButtonTapped(_ sender: UIButton) {
        quantity += 1
    }
    
    @IBAction private func decreaseButtonTapped(_ sender: UIButton) {
        if quantity > 0 {
            quantity -= 1
        }
    }
    
    
    private func quantityUpdate() {
        orderQuantityLabel?.text = "\(quantity)"
        itemCellDelegate?.didUpdateQuantity(id, quantity, index)
    }
}
