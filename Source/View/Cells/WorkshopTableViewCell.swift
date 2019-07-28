//
//  WorkshopTableViewCell.swift
//  KnightHacks
//
//  Created by Lloyd Dapaah on 6/28/19.
//  Copyright © 2019 KnightHacks. All rights reserved.
//

import UIKit

internal class WorkshopTableViewCell: UITableViewCell {
    
    public static let identifier: String = "WorkshopCellIdentifer"
    
    @IBOutlet weak var customCellBackground: UIView!
    @IBOutlet weak var workshopImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var tagStack: UIStackView!
    
    var model: WorkshopModel? {
        didSet {
            guard let model = model else { return }
            
            titleLabel.text = model.title
            timeLabel.text = model.time
            descriptionLabel.text = model.description
            addTags(model.filters)
            
            // fill image
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        addSpecifiedShadow(customCellBackground)
        titleLabel.font = TITLE_FONT
        descriptionLabel.font = PARAGRAPH_FONT
        timeLabel.font = MAJOR_REGULAR_FONT
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) { }
    
    override func setHighlighted(_ highlighted: Bool, animated: Bool) { }
    
    private func addTags(_ filters: [FilterNames]) {
        (0..<3).forEach {
            if $0 < filters.count {
                tagStack.insertArrangedSubview(createLabel(filters[$0].rawValue.capitalized), at: 0)
            }
        }
    }
    
    private func createLabel(_ text: String) -> UILabel {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = GREEN_COLOR
        label.font = PARAGRAPH_FONT
        label.text = text
        return label
    }
}