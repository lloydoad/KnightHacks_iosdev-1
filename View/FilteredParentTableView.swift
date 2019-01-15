//
//  FilteredParentTableView.swift
//  KnightHacks
//
//  Created by KnightHacks on 8/28/18.
//  Copyright © 2018 KnightHacks. All rights reserved.
//

import UIKit

protocol FilteredParentTableViewDelegate {
    func setFilterMenuCellContents() -> [FilterButton]
    func setTableViewCellContents() -> [Int:[Any]]
    func setTableViewHeaderTitles() -> [String]
}

class FilteredParentTableView: ParentTableView {
    
    var filterMenuCollectionViewReference: UICollectionView!
    var headerRowHeight: CGFloat = 60
    var isBarAnimationComplete: Bool = false
    var estimatedNumberOfFilterButtons: CGFloat = 5
    
    // protocol variables
    var childDelegate: FilteredParentTableViewDelegate?
    var filterButtons: [FilterButton] = []
    var tableViewCellContents: [Int : [Any]] = [:]
    var tableViewHeaderTitles: [String] = []
    
    // add or remove headers
    var hasHeaders: Bool = true {
        didSet {
            tableView.reloadData()
        }
    }
    
    override init(style: UITableViewStyle) {
        super.init(style: style)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        // Register separate cells
        tableView.register(FilterMenuTableViewCell.self, forCellReuseIdentifier: FilterMenuTableViewCell.identifier)
    }
    
    // push filter menu behind navigation bar
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // set content provided by child class
        reloadTableContent(withFilter: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        for (index,_) in filterButtons.enumerated() {
            filterMenuCollectionViewReference.deselectItem(at: IndexPath(row: index, section: 0), animated: false)
        }
    }

    func reloadTableContent(withFilter flag: Bool = false) {
        guard let delegate = childDelegate else {
            filterButtons = []
            tableViewCellContents = [:]
            tableViewHeaderTitles = []
            super.tableView.reloadData()
            return
        }
        
        if flag == true {
            filterButtons = delegate.setFilterMenuCellContents()
        }
        
        tableViewCellContents = delegate.setTableViewCellContents()
        tableViewHeaderTitles = delegate.setTableViewHeaderTitles()
        super.tableView.reloadData()
    }
    
    // bring filter button menu cell back down
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // if initial screen load, scroll table and filter menu
        if !isBarAnimationComplete {
            let lastIndexInCollectionView = IndexPath(row: filterButtons.count - 1, section: 0)
            self.filterMenuCollectionViewReference.scrollToItem(at: lastIndexInCollectionView, at: .right, animated: true)
            isBarAnimationComplete = true
        }
    }
}





