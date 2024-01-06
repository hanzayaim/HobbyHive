//
//  PlaceCell.swift
//  HobbyHiveRev
//
//  Created by Raihan Daffa Rizky on 12/12/23.
//

import UIKit

class PlaceCell: UITableViewCell {
    
    @IBOutlet weak var placeImageView: UIImageView!
    
    @IBOutlet weak var placeTitleLabel: UILabel!
    
    @IBOutlet weak var placeAuthorLabel: UILabel!
    
    @IBOutlet weak var placeDescriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
