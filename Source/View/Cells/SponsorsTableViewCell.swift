//
//  SponsorsTableViewCell.swift
//  KnightHacks
//
//  Created by Lloyd Dapaah on 7/28/19.
//  Copyright © 2019 KnightHacks. All rights reserved.
//

import UIKit

internal class SponsorsTableViewCell: UITableViewCell {
    
    public static let identifier: String = "SponsorsCellIdentifer"
    
    @IBOutlet weak var sponsorImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var tagStack: UIStackView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var customBackgroundView: UIView!
    
    var model: SponsorModel? {
        didSet {
            guard let model = model else { return }
            nameLabel.text = model.name
            descriptionLabel.text = model.description
            locationLabel.text = model.location
            // add tags
            // fetch image
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        nameLabel.font = TITLE_FONT
        descriptionLabel.font = PARAGRAPH_FONT
        addSpecifiedShadow(customBackgroundView)
    }

    override func setSelected(_ selected: Bool, animated: Bool) { }
    
    override func setHighlighted(_ highlighted: Bool, animated: Bool) { }

}