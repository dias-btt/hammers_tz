//
//  MenuItem.swift
//  Hammers_TZ
//
//  Created by Диас Сайынов on 12.01.2024.
//

import Foundation

struct MenuData: Codable {
    let categories: [Category]
}

struct Category: Codable {
    let name: String
    let items: [MenuItem]
}

struct MenuItem: Codable {
    let name: String
    let description: String
    let price: Double
    let image: String
}
