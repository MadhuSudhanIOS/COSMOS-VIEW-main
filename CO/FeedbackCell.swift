//
//  FeedbackCell.swift
//  CO
//
//  Created by Rajesh Parimala on 03/11/22.
//

import UIKit
import Cosmos
import TinyConstraints

class FeedbackCell: UITableViewCell {

    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var questionLabel: UILabel!
    
    
    @IBOutlet weak var cosmosView: CosmosView! {
        didSet {
            cosmosView.settings.filledImage = UIImage(named: "RatingStarFilled")?.withRenderingMode(.alwaysOriginal)
            cosmosView.settings.emptyImage = UIImage(named: "RatingStarEmpty")?.withRenderingMode(.alwaysOriginal)
                
            cosmosView.settings.totalStars = 5
            cosmosView.settings.starSize = 30
            cosmosView.settings.starMargin = 3.3
            cosmosView.settings.fillMode = .precise
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
