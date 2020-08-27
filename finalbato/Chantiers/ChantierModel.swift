//
//  ChantierModel.swift
//  finalbato
//
//  Created by Ludus Académie on 03/12/2019.
//  Copyright © 2019 Ludus Académie. All rights reserved.
//

import Foundation
import UIKit

class ChantierModel: NSObject {
    
    var IDChantier:   String!
    var Libelle: String!
    var Statut: String!
    var DateDebut: String!
    var DateFin: String!
    var NomClient: String!
    
    
    
    
    
    
    //empty constructor
    
    override init()
    {
        
    }
    
    //construct with @name, @address, @latitude, and @longitude parameters
    
    init(IDChantier: String, Libelle: String, Statut: String) {
        
        self.IDChantier = IDChantier
        self.Libelle = Libelle
        self.Statut = Statut
        
        
        
        
    }
    
    
    //prints object's current state
    
    override var description: String {
        return "ID: \( IDChantier as Optional), Libelle: \(Libelle as Optional), Statut: \(Statut as Optional)"
    }
    
    
    
}
