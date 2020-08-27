//
//  Commentary2TableViewCell.swift
//  finalbato
//
//  Created by Ludus Académie on 14/11/2018.
//  Copyright © 2018 Ludus Académie. All rights reserved.
//

import UIKit

class Commentary2TableViewCell: UITableViewCell {

    @IBOutlet weak var Technicien_lbl: UILabel!
    @IBOutlet weak var Com_lbl: UILabel!
    var imgtext: UIImage? = nil
    var imgviewtext = UIImageView(image: nil)
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        // invoke superclass implementation
        super.prepareForReuse()
        self.imgtext = nil
        self.imgviewtext.image = nil 
        self.imgviewtext.isUserInteractionEnabled = false
        self.imgviewtext.removeFromSuperview()
        
    }

}
