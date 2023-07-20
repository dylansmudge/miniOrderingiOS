//
//  Material.swift
//  MiniOrder
//
//  Created by Dylan Carlyle on 11/07/23.
//  Copyright © 2023 SmudgeApps. All rights reserved.
//

import Foundation

struct Material: Codable {
    var id: Int
    var imageName: String
    var displayName: String
    
}

struct Materials: Codable {
    let materials: [Material]
}
