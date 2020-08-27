//
//  MateriauModel.swift
//  finalbato
//
//  Created by Ludus Académie on 03/12/2019.
//  Copyright © 2019 Ludus Académie. All rights reserved.
//

//
//  ChantierModel.swift
//  finalbato
//
//  Created by Ludus Académie on 03/12/2019.
//  Copyright © 2019 Ludus Académie. All rights reserved.
//

import Foundation
import UIKit

class MateriauModel: NSObject {
    
    var IDMateriau:   String!
    var Intitule: String!
    var Qte: String!
    var NomTech: String!
    var Prix: String!
    var PA: String!
    
    
    
    
    
    
    
    //empty constructor
    
    override init()
    {
        
    }
    
    //construct with @name, @address, @latitude, and @longitude parameters
    
    init(IDMateriau: String, Intitule: String, Qte: String, NomTech: String, PA: String) {
        
        self.IDMateriau = IDMateriau
        self.Intitule = Intitule
        self.NomTech = NomTech
        self.Qte = Qte
        self.PA = PA
        
        
        
        
    }
    
    
    //prints object's current state
    
    override var description: String {
        return "ID: \( IDMateriau as Optional), Libelle: \(Intitule as Optional), Statut: \(Qte as Optional)"
    }
    
    
    
}
