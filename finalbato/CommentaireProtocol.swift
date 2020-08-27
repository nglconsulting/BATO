//
//  CommentaireProtocol.swift
//  finalbato
//
//  Created by Ludus Académie on 07/11/2018.
//  Copyright © 2018 Ludus Académie. All rights reserved.
//


import UIKit
import Foundation

protocol CommentaireProtocol: class {
    
    func itemsDownloadedCommentaire(itemsCom: NSArray)
    
    
    
}


class Commentaire: NSObject, URLSessionDataDelegate{
    
    //properties
    
    weak var delegate: HomeModelProtocol!
    
    var data = Data()
    
   
    
    
    
    func downloadItemsCommentaire() {
        
       
        var urlPath: String = "placeholder"
        
       
       
        
        urlPath = "http://entreprise-bato.fr/Apps_Bato/commentaire.php"
       
        
        
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
    
    func testdl(){
        
        
            
            
            let url = NSURL(string: "http://localhost:8888/login.php")
            var request = URLRequest(url: url! as URL)
            request.httpMethod = "POST"
            
            
            
            var dataString = "secretWord=44fdcv8jf3" // starting POST string with a secretWord
            
            dataString = dataString + "&choix=isse"// add items as name and value
            
            
            
        
            
            let dataD = dataString.data(using: .utf8) // convert to utf8 string
            
            do
            {
                
                // the upload task, uploadJob, is defined here
                
                let uploadJob = URLSession.shared.uploadTask(with: request, from: dataD!)
                print("test")
                uploadJob.resume()
            }
            
        
            
            
            
        
    }
    
    func parseJSON(_ data:Data) {
        
        var jsonResult = NSArray()
        
       
        let commentaires = NSMutableArray()
        
        do{
            jsonResult = try JSONSerialization.jsonObject(with: data, options:JSONSerialization.ReadingOptions.allowFragments) as! NSArray
            
        } catch let error as NSError {
            print(error)
            
        }
        
        var jsonElement = NSDictionary()
        
        
        
        
        for i in 0 ..< jsonResult.count
        {
            
            jsonElement = jsonResult[i] as! NSDictionary
            
            
            
            let commentaire = CommentaireModel()
            
            
            
            commentaire.Nom_Technicien = jsonElement["IDTechnicien"] as? String
            commentaire.TexteCommentaire = jsonElement["Texte_Commentaire"] as? String
            
            
            
            
            commentaires.add(commentaire)
            
            
            
        }
        //print(commentaires)
        DispatchQueue.main.async(execute: { () -> Void in
         
            self.delegate.itemsDownloaded3(items: commentaires)
         
         })
        
        
        /*switch tablechoix{
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
         
         
         
         case "techniciens":
         
         
         for i in 0 ..< jsonResult.count
         {
         
         jsonElement = jsonResult[i] as! NSDictionary
         
         
         
         let technicien = TechnicienModel()
         
         
         
         technicien.nom = jsonElement["Technicien_Nom"] as? String
         technicien.mdp = jsonElement["mdp"] as? String
         
         
         
         
         techniciens.add(technicien)
         
         
         
         }
         /* DispatchQueue.main.async(execute: { () -> Void in
         
         self.delegate.itemsDownloadedTechnicien(itemsTech: techniciens)
         
         })*/
         
         
         
         
         
         case "commentaire":
         
         
         for i in 0 ..< jsonResult.count
         {
         
         jsonElement = jsonResult[i] as! NSDictionary
         
         
         
         let commentaire = CommentaireModel()
         
         
         
         commentaire.IDTechnicien = jsonElement["IDTechnicien"] as? String
         commentaire.TexteCommentaire = jsonElement["Texte_Commentaire"] as? String
         
         
         
         
         commentaires.add(commentaire)
         
         
         
         }
         /*DispatchQueue.main.async(execute: { () -> Void in
         
         self.delegate.itemsDownloadedCommentaire(itemsCom: commentaires)
         
         })*/
         
         
         
         
         
         
         default:
         print("default")
         }
         
         
         DispatchQueue.main.async(execute: { () -> Void in
         
         self.delegate.itemsDownloadedClient(itemsCli: clients)
         
         
         })*/
        
        
     
        
    }
    
    
}

