//
//  bookmarkTableViewCell.swift
//  DesignCodeApp
//
//  Created by mhd tahhan on 7/14/18.
//  Copyright © 2018 mhd tahhan. All rights reserved.
//

import UIKit

class bookmarkTableViewCell: UITableViewCell {
    
    @IBOutlet weak var badgeImageView: UIImageView!
    @IBOutlet weak var chapterNumberLabel: UILabel!
    @IBOutlet weak var chapterTitleLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
