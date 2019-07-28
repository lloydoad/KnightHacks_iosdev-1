//
//  LiveUpdateTableViewControllerModel.swift
//  KnightHacks
//
//  Created by Lloyd Dapaah on 7/25/19.
//  Copyright © 2019 KnightHacks. All rights reserved.
//

import Foundation

internal class LiveUpdateTableViewControllerModel {
    
    private var lastUpdateDate: Date?
    private(set) var viewContent: [LiveUpdateModel] = []
    
    var observer: ModelObserver?
    
    func fetchRecent() {
        // make network call
        var fetchedData: [LiveUpdateModel] = []
        
        if let lastUpdateDate = lastUpdateDate {
            print(lastUpdateDate)
            fetchedData = dummySecondUpdate
        } else {
            fetchedData = dummyFirstUpdate
        }
        
        if let first = fetchedData.first {
            lastUpdateDate = first.date.addingTimeInterval(1)
        }
        
        fetchedData.sort()
        fetchedData.reverse()
        viewContent.insert(contentsOf: fetchedData, at: 0)
        observer?.didFetchModel()
    }
}