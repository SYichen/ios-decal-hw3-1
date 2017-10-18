//
//  FeedDisplayCellTableViewCell.swift
//  Snapchat Clone
//
//  Created by Yichen Sun on 10/17/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import UIKit

class FeedDisplayCellTableViewCell: UITableViewCell {

    @IBOutlet weak var timeStamp: UILabel!
    @IBOutlet weak var read: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
