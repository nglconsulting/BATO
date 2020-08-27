//
//  DevisTableViewCell.swift
//  finalbato
//
//  Created by Ludus Académie on 22/05/2018.
//  Copyright © 2018 Ludus Académie. All rights reserved.
//

import UIKit
import PDFKit


class DevisTableViewCell: UITableViewCell {

    @IBOutlet weak var Comlbl: UILabel!
    @IBOutlet weak var Devislbl: UILabel!
    
    @IBOutlet weak var PDFBtn: UIButton!
     var PDFBtnAction: (() -> ())?
    
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
        
    /*    self.imgtext = nil
        self.imgviewtext.image = nil
        self.imgviewtext.isUserInteractionEnabled = false
        self.imgviewtext.removeFromSuperview()
        */
    }

    @IBAction func PDFBtnClick(_ sender: UIButton) {
        PDFBtnAction?()
    }
}
