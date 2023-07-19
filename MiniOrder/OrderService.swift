//
//  OrderService.swift
//  MiniOrder
//
//  Created by Dylan Carlyle on 11/07/23.
//  Copyright © 2023 SmudgeApps. All rights reserved.
//

import Foundation

class OrderService {
    
    var materials = [Material]()
    var selectedImage: String?
    
    var orderedMaterials = [Int: OrderedMaterial]()
    
    
    // MARK: - JSON
    
    func readLocalJSONFile(forName name: String) -> Data? {
        do {
            if let filePath = Bundle.main.path(forResource: name, ofType: "json") {
                let fileUrl = URL(fileURLWithPath: filePath)
                let data = try Data(contentsOf: fileUrl)
                return data
            }
        } catch {
            print("error: \(error)")
        }
        return nil
    }
    
    func parse(jsonData: Data) -> Materials? {
        do {
            let decodedData = try JSONDecoder().decode(Materials.self, from: jsonData)
            return decodedData
        } catch {
            print("error: \(error)")
        }
        return nil
    }
    
    func loadData(){
        let jsonData = readLocalJSONFile(forName: "materials")
        if let data = jsonData {
            if let materials = parse(jsonData: data) {
                self.materials = materials.materials
                print(materials.materials)
            }
        }
    }
    
    func saveQuantity(_ id: Int, _ quantity: Int, _ index: Int) {
        if var orderedMaterial = orderedMaterials[id] {
            orderedMaterial.quantity = quantity
            orderedMaterial.index = index
            orderedMaterials[id] = orderedMaterial
        }
        else {
            orderedMaterials[id] = OrderedMaterial(id: id, quantity: quantity, index: index)
        }
    }
    
    func retrieveQuantity(id: Int) -> Int {
        guard let validQuantity = orderedMaterials[id]
        else {
            return 0
        }
        return validQuantity.quantity
    }

}
