//
//  MateriauxRecTableViewCell.swift
//  finalbato
//
//  Created by Ludus Académie on 03/12/2019.
//  Copyright © 2019 Ludus Académie. All rights reserved.
//

import UIKit

class MateriauxRecTableViewCell: UITableViewCell {

    @IBOutlet weak var Prixlbl: UILabel!
    @IBOutlet weak var Qtelbl: UILabel!
    @IBOutlet weak var MateriauxReclbl: UILabel!
    @IBOutlet weak var NomTechnicienlbl: UILabel!
    
    @IBOutlet weak var PAlbl: UILabel!
    @IBOutlet weak var IDMateriaulbl: UILabel!
    var DeleteBtnAction: (() -> ())?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func OnDeleteClick(_ sender: UIButton) {
        DeleteBtnAction?()
    }
}
