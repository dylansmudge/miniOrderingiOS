//
//  OrderSummaryViewController.swift
//  MiniOrder
//
//  Created by Dylan Carlyle on 11/07/23.
//  Copyright © 2023 SmudgeApps. All rights reserved.
//

import UIKit


class OrderSummaryViewController: UICollectionViewController {
    
    var orderedMaterials : [OrderedMaterial] = []
    
    override func viewDidLoad() {
        // Initialize the collection view layout
        super.viewDidLoad()

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return orderedMaterials.count
    }
        
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Order", for: indexPath) as? OrderCell else {
            fatalError("Unable to dequeue item cell")
        }
        
        //Apply custom design
        cell.contentView.layer.borderColor = UIColor.clear.cgColor;
        cell.contentView.layer.masksToBounds = true;
        
        cell.layer.shadowColor = UIColor.lightGray.cgColor;
        cell.layer.shadowOffset = CGSizeMake(0, 1.5);
        cell.layer.shadowRadius = 15.0;
        cell.layer.shadowOpacity = 0.3;
        cell.layer.masksToBounds = false;
        cell.layer.shadowPath = UIBezierPath(roundedRect:cell.bounds, cornerRadius:cell.contentView.layer.cornerRadius).cgPath;
        
        let material = orderedMaterials[indexPath.row]

        cell.quantityLabel.text = "\(material.quantity)"
        cell.idLabel.text = "\(material.id)"
        
        return cell
    }
    
}
