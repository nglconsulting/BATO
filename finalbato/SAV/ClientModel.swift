//
//  ClientModel.swift
//  finalbato
//
//  Created by Ludus Académie on 24/05/2018.
//  Copyright © 2018 Ludus Académie. All rights reserved.
//

import UIKit
import Foundation

class ClientModel: NSObject {
    //properties
    
    var IDClient:   String!
    var nom: String!
    var addresse: String?
    var Numtel: String?
    var Mail: String?
    var CPClient: String?
    
    
    
    
    //empty constructor
    
    override init()
    {
        
    }
    
    //construct with @name, @address, @latitude, and @longitude parameters
    
    init(IDClient: String, nom: String, addresse: String, Numtel: String, Mail: String, CPClient: String) {
        
        self.IDClient = IDClient
        self.nom = nom
        self.addresse = addresse
        self.Numtel = Numtel
        self.Mail = Mail
        self.CPClient = CPClient
        
    }
    
    
    //prints object's current state
    
    override var description: String {
        return "ID: \(IDClient as Optional), nom: \(nom as Optional), addresse: \(addresse as Optional), Numtel: \(Numtel as Optional), mail: \(Mail as Optional), CP: \(CPClient as Optional) "
        
    }

}
