//
//  DataModel.swift
//  Covid 3
//
//  Created by Yogesh Tekwani on 6/1/23.
//

import Foundation

typealias allData = [String: Details]

struct Details: Codable{
    let meta : Meta
    let total : Total
}

struct Meta: Codable{
    let date: String
    let population: Int
}

struct Total: Codable{
    let confirmed: Int
}
