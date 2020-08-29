//
//  HomeModel.swift
//  finalbato
//
//  Created by Ludus Académie on 24/05/2018.
//  Copyright © 2018 Ludus Académie. All rights reserved.
//

import UIKit
import Foundation

protocol HomeModelProtocol: class {
    func itemsDownloaded1(items: NSArray)
    func itemsDownloaded2(items: NSArray)
    func itemsDownloaded3(items: NSArray)
    
    
}


class HomeModel: NSObject, URLSessionDataDelegate{
    
    //properties
    
    weak var delegate: HomeModelProtocol!
    
    var data = Data()
    let group = DispatchGroup()
    
    var tablechoix = "test"
    
    var  IP = "entreprise-bato.fr/Apps_Bato"
    
    

    func downloadItems(de table: String) {
        
        tablechoix = table
        var urlPath: String = "placeholder"
        
        switch table{
        case "client":
            urlPath = "http://\(IP)/client.php"
            
        case "techniciens":
            urlPath = "http://\(IP)/techniciens.php"
            
        case "commentaire":
            urlPath = "http://\(IP)/commentaire.php"
            
        case "appel":
            urlPath = "http://\(IP)/appel.php"
        
        case "techniciens_appel":
            urlPath = "http://\(IP)/techniciens_appel.php"
            
        case "chantier":
            urlPath = "http://\(IP)/chantier.php"
            
        case "materiaux":
            urlPath = "http://\(IP)/materiaux.php"
            
        case "devis":
            urlPath = "http://\(IP)/devis.php"
            
        
        
            
            
        default:
            print("defaut")
        }
       // tablechoix = table
        
      //  urlPath = "http://localhost:8888/client.php"
        
        let url: URL = URL(string: urlPath)!
        let defaultSession = Foundation.URLSession(configuration: URLSessionConfiguration.default)
        
        let task = defaultSession.dataTask(with: url) { (data, response, error) in
            
            if error != nil {
                print("Failed to download data")
            }else {
                print("Data downloaded")
                self.parseJSON(data!)
            }
            
        }
        
        task.resume()
    }
    
    func downloadcoms(de IDClient: String, sur tab: String){
        
      let urlPath = "http://\(IP)/commentaire.php"
        let url: URL = URL(string: urlPath)!
        var request = URLRequest(url: url as URL)
        request.httpMethod = "POST"
        //request.addValue("application/json", forHTTPHeaderField: "Content-Type")
     //   let defaultSession = Foundation.URLSession(configuration: URLSessionConfiguration.default)
        
        var dataString = "secretWord=44fdcv8jf3" // starting POST string with a secretWord
        
        
        
        
        dataString = dataString + "&item=\(IDClient)"
        dataString = dataString + "&item2=\(tab)"
        
       //  dataString = dataString + "&item=28"
      
        let dataD = dataString.data(using: .utf8) // convert to utf8 string
        
       
       
        let uploadJob = URLSession.shared.uploadTask(with: request, from: dataD)
        {
            data, response, error in
            
            if error != nil {
                
                // display an alert if there is an error inside the DispatchQueue.main.async
                
                DispatchQueue.main.async
                    {
                        //pas marché
                        print("fail")
                }
            }
            else
           {
        
             self.parseJSON(data!)
            
            }
        }
        
        uploadJob.resume()
        
        //fin du collage
        
        
        
        
        
        
        
        tablechoix = "commentaire"
        
        
        
        
    }
    func downloadtechs(de IDTechnicien: String,  mdp: String){
       
     let urlPath = "http://\(IP)/techniciens.php"
       let url: URL = URL(string: urlPath)!
       var request = URLRequest(url: url as URL)
       request.httpMethod = "POST"
       //request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    //   let defaultSession = Foundation.URLSession(configuration: URLSessionConfiguration.default)
       
       var dataString = "secretWord=44fdcv8jf3" // starting POST string with a secretWord
       
       
       
       
       dataString = dataString + "&item=\(IDTechnicien)"
       dataString = dataString + "&item2=\(mdp)"
       
      //  dataString = dataString + "&item=28"
     
      let dataD = dataString.data(using: .utf8) // convert to utf8 string
            
           
           
            let uploadJob = URLSession.shared.uploadTask(with: request, from: dataD)
            {
                data, response, error in
                
                if error != nil {
                    
                    // display an alert if there is an error inside the DispatchQueue.main.async
                    
                    DispatchQueue.main.async
                        {
                            //pas marché
                            print("fail")
                    }
                }
                else
               {
                 self.parseJSON(data!)
                }
                
                
                //fin du else
        
    
            }
            
            uploadJob.resume()
            
            //fin du collage
            
            
            
            
            
            
            
            tablechoix = "techniciens"
            
            
            
        
        
        
    }
       
        
    
    
    func downloadmateriauxrec(de IDTechnicien: String, sur chantier: String, future: String){
        
        let urlPath = "http://\(IP)/materiauxrec.php"
        let url: URL = URL(string: urlPath)!
        var request = URLRequest(url: url as URL)
        request.httpMethod = "POST"
        //request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        //   let defaultSession = Foundation.URLSession(configuration: URLSessionConfiguration.default)
        
        var dataString = "secretWord=44fdcv8jf3" // starting POST string with a secretWord
        
        
        
        
        dataString = dataString + "&item=\(IDTechnicien)"
         dataString = dataString + "&item2=\(chantier)"
         dataString = dataString + "&item3=\(future)"
        
        //  dataString = dataString + "&item=28"
        
        let dataD = dataString.data(using: .utf8) // convert to utf8 string
        
        
        
        let uploadJob = URLSession.shared.uploadTask(with: request, from: dataD)
        {
            data, response, error in
            
            if error != nil {
                
                // display an alert if there is an error inside the DispatchQueue.main.async
                
                DispatchQueue.main.async
                    {
                        //pas marché
                        print("fail")
                }
            }
            else
            {
                
               self.parseJSON(data!)
                
                
            }
        }
        
        uploadJob.resume()
        
        //fin du collage
        
        
        
        
        
        
        
        tablechoix = "materiauxrec"
        
        
        
        
    }
    
    func parseJSON(_ data:Data) {
        
        var jsonResult = NSArray()
        let clients = NSMutableArray()
        let commentaires = NSMutableArray()
        let techniciens = NSMutableArray()
        let appels = NSMutableArray()
        let techniciens_appels = NSMutableArray()
        let chantiers = NSMutableArray()
        let materiaux = NSMutableArray()
        let devis = NSMutableArray()
        
        do{
            jsonResult = try JSONSerialization.jsonObject(with: data, options:JSONSerialization.ReadingOptions.allowFragments) as! NSArray
            
        } catch let error as NSError {
            
            print(error)
            
        }
        
        var jsonElement = NSDictionary()
        
        switch tablechoix{
        case "client":
           
            
            for i in 0 ..< jsonResult.count
            {
                
                jsonElement = jsonResult[i] as! NSDictionary
                
                
                
                let client = ClientModel()
                
                //test pr voir que c'est pas niil
                /* if //let IDClient = jsonElement["IDClient"] as? String,
                 let nom = jsonElement["Nom"] as? String,
                 let adresse = jsonElement["Adresse"] as? String,
                 let numtel = jsonElement["NumTel"] as? String,
                 let mail = jsonElement["Mail"] as? String,
                 let CPClient = jsonElement["CP"] as? String
                 
                 { */
                
                client.IDClient = jsonElement["IDClient"] as? String
                client.nom = jsonElement["Nom"] as? String
                client.addresse = jsonElement["Adresse"] as? String
                client.Numtel = jsonElement["NumTel"] as? String
                client.Mail = jsonElement["Mail"] as? String
                client.CPClient = jsonElement["CPClient"] as? String
                
                // }
                
                clients.add(client)
                
                
                
            }
            DispatchQueue.main.async(execute: { () -> Void in
                
                self.delegate.itemsDownloaded1(items: clients)
                
            })

            
        case "techniciens":
            
            
            
            for i in 0 ..< jsonResult.count
            {
                group.enter()
                jsonElement = jsonResult[i] as! NSDictionary
                
                
                
                let technicien = TechnicienModel()
                
            
                 
                technicien.nom = jsonElement["nom"] as? String
                technicien.IDTechnicien = jsonElement["id"] as? String
               // technicien.mdp = jsonElement["mdp"] as? String
              //  technicien.IDTechnicien = jsonElement["IDTechnicien"] as? String
                //print(technicien.nom)
               
                
                techniciens.add(technicien)
                self.group.leave()
                
                
            }
          // DispatchQueue.main.async(execute: { () -> Void in
                group.notify(queue: .main) {
                self.delegate.itemsDownloaded2(items: techniciens)
                print("appel de la fonction")
            }
           // })
            
            
            
            
            
        case "commentaire":
           
            
            for i in 0 ..< jsonResult.count
            {
                
                jsonElement = jsonResult[i] as! NSDictionary
                
                
                
                let commentaire = CommentaireModel()
                
                
                
                
                commentaire.Nom_Technicien = jsonElement["Technicien_Nom"] as? String
                commentaire.TexteCommentaire = jsonElement["Texte_Commentaire"] as? String
                commentaire.photo = jsonElement["photo"] as? String
             
                
                commentaires.add(commentaire)
                
                
                
            }
            DispatchQueue.main.async(execute: { () -> Void in
              //  print(commentaires)
                self.delegate.itemsDownloaded3(items: commentaires)
                
            })
            
        case "appel":
            
            
            for i in 0 ..< jsonResult.count
            {
                
                jsonElement = jsonResult[i] as! NSDictionary
                
                
                
                let appel = AppelModel()
                
                
                
                
                appel.IDAppel = jsonElement["IDAppel"] as? String
                appel.Description = jsonElement["Descri"] as? String
                appel.commentaire = jsonElement["Com"] as? String
                appel.statut = jsonElement["IDStatut"] as? String
                appel.client = jsonElement["Nom"] as? String
                
                
                appels.add(appel)
                
                
                
            }
            DispatchQueue.main.async(execute: { () -> Void in
                //  print(appels)
                self.delegate.itemsDownloaded1(items: appels)
                
            })
            
        case "techniciens_appel":
            
            
            for i in 0 ..< jsonResult.count
            {
                
                jsonElement = jsonResult[i] as! NSDictionary
                
                
                
                let technicien = Techniciens_appelModel()
                
                
                
                
                technicien.IDAppel = jsonElement["IDAppel"] as? String
                technicien.IDTechnicien = jsonElement["IDTechnicien"] as? String
                technicien.Nom = jsonElement["Technicien_Nom"] as? String
                
                techniciens_appels.add(technicien)
                
                
                
                
            }
            DispatchQueue.main.async(execute: { () -> Void in
                //  print(appels)
                self.delegate.itemsDownloaded2(items: techniciens_appels)
                
            })
            
        case "chantier":
            
            
            for i in 0 ..< jsonResult.count
            {
                
                jsonElement = jsonResult[i] as! NSDictionary
                
                
                
                let chantier = ChantierModel()
                
                
                
                
                chantier.IDChantier = jsonElement["IDChantier"] as? String
                chantier.NomClient = jsonElement["Nom"] as? String
                chantier.Libelle = jsonElement["libellé"] as? String
                chantier.Statut = jsonElement["IDStatut"] as? String
                chantier.DateFin = jsonElement["Date_Fin"] as? String
                chantier.DateDebut = jsonElement["Date_Debut"] as? String
                
                chantiers.add(chantier)
                
                
                
                
            }
            DispatchQueue.main.async(execute: { () -> Void in
                
                self.delegate.itemsDownloaded1(items: chantiers)
                
            })
            
        case "materiaux":
            
            
            for i in 0 ..< jsonResult.count
            {
                
                jsonElement = jsonResult[i] as! NSDictionary
                
                
                
                let materiau = MateriauModel()
                
                
                
                
                materiau.IDMateriau = jsonElement["IDMatériau"] as? String
                materiau.Intitule = jsonElement["Intitulé"] as? String
                materiau.Qte = jsonElement["Qté"] as? String
                materiau.Prix = jsonElement["Prix_unitaire_public"] as? String
                
                materiaux.add(materiau)
                
                
                
                
            }
            DispatchQueue.main.async(execute: { () -> Void in
                
                self.delegate.itemsDownloaded1(items: materiaux)
                
            })
            
        case "materiauxrec":
            
            
            for i in 0 ..< jsonResult.count
            {
                
                jsonElement = jsonResult[i] as! NSDictionary
                
                
                
                let materiau = MateriauModel()
                
                
                
                
                materiau.IDMateriau = jsonElement["IDMatériau"] as? String
                materiau.Intitule = jsonElement["Intitulé"] as? String
                materiau.Qte = jsonElement["rec_qté"] as? String
                materiau.NomTech = jsonElement["Technicien_Nom"] as? String
                materiau.Prix = jsonElement["Prix_unitaire_public"] as? String
                materiau.PA = jsonElement["Prix_unitaire_Achat"] as? String
                
                materiaux.add(materiau)
                
                
                
                
            }
            DispatchQueue.main.async(execute: { () -> Void in
               
                self.delegate.itemsDownloaded1(items: materiaux)
                
            })
            
        case "devis":
            
            
            for i in 0 ..< jsonResult.count
            {
                
                jsonElement = jsonResult[i] as! NSDictionary
                
                
                
                let devi = DevisModel()
                
                
                
                
                devi.IDDevis = jsonElement["IDDEVIS"] as? String
                devi.commentaire = jsonElement["commentaire"] as? String
                devi.PDF = jsonElement["PDF_devis"] as? String
                devi.NomClient = jsonElement["Nom"] as? String
                
                devis.add(devi)
                
                
                
                
            }
            DispatchQueue.main.async(execute: { () -> Void in
                
                self.delegate.itemsDownloaded1(items: devis)
                
            })
            
            
        default:
            print("default")
        }
        
        
        
            
        
        
      
        
        
     /*   for i in 0 ..< jsonResult.count
        {
            
            jsonElement = jsonResult[i] as! NSDictionary
            
            
            
            let client = ClientModel()
            
            //test pr voir que c'est pas niil
            /* if //let IDClient = jsonElement["IDClient"] as? String,
             let nom = jsonElement["Nom"] as? String,
             let adresse = jsonElement["Adresse"] as? String,
             let numtel = jsonElement["NumTel"] as? String,
             let mail = jsonElement["Mail"] as? String,
             let CPClient = jsonElement["CP"] as? String
             
             { */
            
            client.IDClient = jsonElement["IDClient"] as? String
            client.nom = jsonElement["Nom"] as? String
            client.addresse = jsonElement["Adresse"] as? String
            client.Numtel = jsonElement["NumTel"] as? String
            client.Mail = jsonElement["Mail"] as? String
            client.CPClient = jsonElement["CPClient"] as? String
            
            // }
            
            clients.add(client)
            
            
            
        }
       
        
        
        
     //
      //  print(clients)
       // print(commentaires)
        
        
            DispatchQueue.main.async(execute: { () -> Void in
            
            self.delegate.itemsDownloadedClient(itemsCli: clients)
            
            
            })
        */
    }
    
    
}

