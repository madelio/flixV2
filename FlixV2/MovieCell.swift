//
//  MovieCell.swift
//  FlixV2
//
//  Created by Madel Asistio on 11/17/17.
//  Copyright © 2017 Madel Asistio. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {

    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
  
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
