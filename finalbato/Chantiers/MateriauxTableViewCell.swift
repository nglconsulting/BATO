//
//  MateriauxTableViewCell.swift
//  finalbato
//
//  Created by Ludus Académie on 03/12/2019.
//  Copyright © 2019 Ludus Académie. All rights reserved.
//

import UIKit

class MateriauxTableViewCell: UITableViewCell {

    @IBOutlet weak var EnvoiBtn: UIButton!
    @IBOutlet weak var Stepper: UIStepper!
    @IBOutlet weak var Qtetxtf: UITextField!
    @IBOutlet weak var Libellelbl: UILabel!
    @IBOutlet weak var IDMateriaulbl: UILabel!
    
    var StepperAction : (() -> ())?
    var SendBtnAction: (() -> ())?
    
    @IBAction func OnValueChange(_ sender: UIStepper) {
        StepperAction?()
    }
    
    
    @IBAction func OnSendBtnClick(_ sender: UIButton) {
        SendBtnAction?()
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
