//
//  ViewController.swift
//  MiniOrder
//
//  Created by Daniel Warrington on 9/11/15.
//  Copyright © 2015 SmudgeApps. All rights reserved.
//

import UIKit


class ViewController: UICollectionViewController, ItemCellDelegate {
    
    func didUpdateQuantity(_ id: Int, _ quantity: Int, _ index: Int) {
        orderService.saveQuantity(id, quantity, index)
    }
    
    private let orderService = OrderService()
    
    override func viewDidLoad() {
        // Initialize the collection view layout
        super.viewDidLoad()
        
        // Load the materials data
        orderService.loadData()
        collectionView.dataSource = self
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return orderService.materials.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Item", for: indexPath) as? ItemCell else {
            fatalError("Unable to dequeue item cell")
        }
        
        //Apply custom design
        cell.layer.cornerRadius = 30.0
        cell.contentView.layer.borderColor = UIColor.clear.cgColor;
        cell.contentView.layer.masksToBounds = true;
        
        cell.layer.shadowColor = UIColor.lightGray.cgColor;
        cell.layer.shadowOffset = CGSizeMake(0, 1.5);
        cell.layer.shadowRadius = 30.0;
        cell.layer.shadowOpacity = 0.6;
        cell.layer.masksToBounds = false;
        cell.layer.shadowPath = UIBezierPath(roundedRect:cell.bounds, cornerRadius:cell.contentView.layer.cornerRadius).cgPath;
        
        cell.itemCellDelegate = self
        
        let material = orderService.materials[indexPath.row]
        cell.label?.text = material.displayName
        
        cell.id = material.id
        cell.quantity = orderService.retrieveQuantity(id: cell.id)
        cell.index = indexPath.row
        
        cell.imageView.image = UIImage.init(named: material.imageName)
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showOrderSummarySegue" {
            let orderSummaryViewController = segue.destination as? OrderSummaryViewController
            let orderMaterials = orderService.orderedMaterials.compactMap{ (_ , orderMaterial: OrderedMaterial) in
                if orderMaterial.quantity > 0 {
                    return orderMaterial
                }
                else {
                    return nil
                }
            }
            orderSummaryViewController?.orderedMaterials = orderMaterials.sorted(by: {$0.index > $1.index})
        }
    }
}



    
