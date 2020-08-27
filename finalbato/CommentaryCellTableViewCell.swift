//
//  CommentaryCellTableViewCell.swift
//  finalbato
//
//  Created by Ludus Académie on 06/06/2018.
//  Copyright © 2018 Ludus Académie. All rights reserved.
//

import UIKit

class CommentaryCellTableViewCell: UITableViewCell {

    @IBOutlet weak var lblcommentary: UILabel!
    @IBOutlet weak var lblname: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
