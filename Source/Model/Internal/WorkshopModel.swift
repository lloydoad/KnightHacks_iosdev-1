//
//  WorkshopModel.swift
//  KnightHacks
//
//  Created by Lloyd Dapaah on 7/25/19.
//  Copyright © 2019 KnightHacks. All rights reserved.
//

import Foundation

internal struct WorkshopModel: HeaderDataSource, FilterDataSource, Comparable {
    
    var date: Date
    var time: String
    var title: String
    var header: String
    var imageURL: String?
    var description: String
    var filters: [FilterNames]
    
    init(date: Date, time: String, title: String, header: String, imageURL: String? = nil, description: String, filters: [FilterNames]) {
        self.date = date
        self.time = time
        self.title = title
        self.header = header
        self.imageURL = imageURL
        self.description = description
        self.filters = filters
    }
    
    static func < (lhs: WorkshopModel, rhs: WorkshopModel) -> Bool {
        return lhs.date.timeIntervalSince1970 - rhs.date.timeIntervalSince1970 < 0
    }
}