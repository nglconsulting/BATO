//
//  upload.swift
//  finalbato
//
//  Created by Ludus Académie on 30/09/2018.
//  Copyright © 2018 Ludus Académie. All rights reserved.
//

import Foundation
import UIKit


class Upload {
    
    var  IP = "entreprise-bato.fr/Apps_Bato"
    
    func u(vc: UIViewController, vers table: String,message: String) {
    
        
        let url = NSURL(string: "http://\(IP)/login.php")
        var request = URLRequest(url: url! as URL)
        request.httpMethod = "POST"
        
        
        
        var dataString = "secretWord=44fdcv8jf3" // starting POST string with a secretWord
        
        dataString = dataString + "&choix=\(table)"// add items as name and value
        
        
        
        dataString = dataString + "&item2=\(message)"
        
        let dataD = dataString.data(using: .utf8) // convert to utf8 string
        
        do
        {
            
            // the upload task, uploadJob, is defined here
            
            let uploadJob = URLSession.shared.uploadTask(with: request, from: dataD)
            {
                data, response, error in
                
                if error != nil {
                    
                    // display an alert if there is an error inside the DispatchQueue.main.async
                    
                    DispatchQueue.main.async
                        {
                            let alert = UIAlertController(title: "Upload Didn't Work?", message: "Looks like the connection to the server didn't work.  Do you have Internet access?", preferredStyle: .alert)
                            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                            vc.present(alert, animated: true, completion: nil)
                    }
                }
                else
                {
                    if let unwrappedData = data {
                        
                        let returnedData = NSString(data: unwrappedData, encoding: String.Encoding.utf8.rawValue) // Response from web server hosting the database
                        
                        if returnedData == "1" // insert into database worked
                        {
                            
                            // display an alert if no error and database insert worked (return = 1) inside the DispatchQueue.main.async
                            
                            DispatchQueue.main.async
                                {
                                    let alert = UIAlertController(title: "Upload OK?", message: "Looks like the upload and insert into the database worked.", preferredStyle: .alert)
                                    alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                                    vc.present(alert, animated: true, completion: nil)
                            }
                        }
                        else
                        {
                            // display an alert if an error and database insert didn't worked (return != 1) inside the DispatchQueue.main.async
                            
                            DispatchQueue.main.async
                                {
                                    
                                    let alert = UIAlertController(title: "Upload Didn't Work", message: "Looks like the insert into the database did not worked.", preferredStyle: .alert)
                                    alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                                    vc.present(alert, animated: true, completion: nil)
                                    
                            }
                        }
                    }
                }
            }
            uploadJob.resume()
        }
        
        
        
        
        
        
        
        
        
        
        
        
        
        }
        
    
    func u2(vers table: String,message: String, de technicien: String, sur client: String, image: UIImage?) {
        var base64String = "nothing"
        if image != nil{
            
            let imagedata = UIImageJPEGRepresentation(image!,0.1)
            //let base64String = convertImageTobase64(image: image)
            let base64String1 = imagedata?.base64EncodedString(options: .lineLength64Characters)
             base64String = base64String1!.replacingOccurrences(of: "+", with: "%2B")
            
            
            
        }
        
        
        let url = NSURL(string: "http://\(IP)/login.php")
        var request = URLRequest(url: url! as URL)
        request.httpMethod = "POST"
        
        
        
        var dataString = "secretWord=44fdcv8jf3" // starting POST string with a secretWord
        
        dataString = dataString + "&choix=\(table)"// add items as name and value
        
       
        
        dataString = dataString + "&item2=\(technicien)"
        dataString = dataString + "&item3=\(client)"
        dataString = dataString + "&item4=\(message)"
        dataString = dataString + "&image=" + base64String
        print(dataString)
        
        let dataD = dataString.data(using: .utf8) // convert to utf8 string
        
        do
        {
            
            // the upload task, uploadJob, is defined here
            
            let uploadJob = URLSession.shared.uploadTask(with: request, from: dataD)
            {
                data, response, error in
                
                if error != nil {
                    
                    // display an alert if there is an error inside the DispatchQueue.main.async
                    
                    DispatchQueue.main.async
                        {
                            let alert = UIAlertController(title: "Upload Didn't Work?", message: "Looks like the connection to the server didn't work.  Do you have Internet access?", preferredStyle: .alert)
                            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                          //  vc.present(alert, animated: true, completion: nil)
                    }
                }
                else
                {
                    if let unwrappedData = data {
                        
                        let returnedData = NSString(data: unwrappedData, encoding: String.Encoding.utf8.rawValue) // Response from web server hosting the database
                        
                        if returnedData == "1" // insert into database worked
                        {
                            
                            // display an alert if no error and database insert worked (return = 1) inside the DispatchQueue.main.async
                            
                            DispatchQueue.main.async
                                {
                                    let alert = UIAlertController(title: "Upload OK?", message: "Looks like the upload and insert into the database worked.", preferredStyle: .alert)
                                    alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                                 //   vc.present(alert, animated: true, completion: nil)
                            }
                        }
                        else
                        {
                            // display an alert if an error and database insert didn't worked (return != 1) inside the DispatchQueue.main.async
                            
                            DispatchQueue.main.async
                                {
                                    
                                    let alert = UIAlertController(title: "Upload Didn't Work", message: "Looks like the insert into the database did not worked.", preferredStyle: .alert)
                                    alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                                //    vc.present(alert, animated: true, completion: nil)
                                    
                            }
                        }
                    }
                }
            }
            uploadJob.resume()
        }
        
        
        
        
        
        
        
        
        
        
        
        
        
    }
    
    //upload dans la section matériaux
    func u3(vers table: String,message: String, de technicien: String, sur client: String, de tech: String, surchantier chantier: String) {
     
        
        
        let url = NSURL(string: "http://\(IP)/login.php")
        var request = URLRequest(url: url! as URL)
        request.httpMethod = "POST"
        
        
        
        var dataString = "secretWord=44fdcv8jf3" // starting POST string with a secretWord
        
        dataString = dataString + "&choix=\(table)"// add items as name and value
        
        print(table)
        print("&item2=\(technicien)")
        print("&item3=\(client)")
        print("&item4=\(message)")
        print("&item5=\(tech)")
        print("&item6=\(chantier)")
        dataString = dataString + "&item2=\(technicien)"
        dataString = dataString + "&item3=\(client)"
        dataString = dataString + "&item4=\(message)"
        dataString = dataString + "&item5=\(tech)"
        dataString = dataString + "&item6=\(chantier)"
        dataString = dataString + "&image=" + "placeholder"
        
        
        
        
        let dataD = dataString.data(using: .utf8) // convert to utf8 string
        
        do
        {
            
            // the upload task, uploadJob, is defined here
            
            let uploadJob = URLSession.shared.uploadTask(with: request, from: dataD)
            {
                data, response, error in
                
                if error != nil {
                    
                    // display an alert if there is an error inside the DispatchQueue.main.async
                    
                    DispatchQueue.main.async
                        {
                            let alert = UIAlertController(title: "Upload Didn't Work?", message: "Looks like the connection to the server didn't work.  Do you have Internet access?", preferredStyle: .alert)
                            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                            //  vc.present(alert, animated: true, completion: nil)
                    }
                }
                else
                {
                    if let unwrappedData = data {
                        
                        let returnedData = NSString(data: unwrappedData, encoding: String.Encoding.utf8.rawValue) // Response from web server hosting the database
                        
                        if returnedData == "1" // insert into database worked
                        {
                            
                            // display an alert if no error and database insert worked (return = 1) inside the DispatchQueue.main.async
                            
                            DispatchQueue.main.async
                                {
                                    let alert = UIAlertController(title: "Upload OK?", message: "Looks like the upload and insert into the database worked.", preferredStyle: .alert)
                                    alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                                    //   vc.present(alert, animated: true, completion: nil)
                            }
                        }
                        else
                        {
                            // display an alert if an error and database insert didn't worked (return != 1) inside the DispatchQueue.main.async
                            
                            DispatchQueue.main.async
                                {
                                    
                                    let alert = UIAlertController(title: "Upload Didn't Work", message: "Looks like the insert into the database did not worked.", preferredStyle: .alert)
                                    alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                                    //    vc.present(alert, animated: true, completion: nil)
                                    
                            }
                        }
                    }
                }
            }
            uploadJob.resume()
        }
        
        
        
        
        
        
        
        
        
        
        
        
        
    }
    
    
    
    
    //permet la conversion d'une image en base64
    func convertImageTobase64(image: UIImage) ->String?
      {
        
        var imageData: Data?
        imageData = UIImagePNGRepresentation(image)
        return imageData?.base64EncodedString()
        
        
        
        
    }
    
    //permet d'uploader une image
    func uimage(fileName: String, image: UIImage)
    {
        let imagedata = UIImageJPEGRepresentation(image,0.1)
        //let base64String = convertImageTobase64(image: image)
        let base64String1 = imagedata?.base64EncodedString(options: .lineLength64Characters)
        let base64String = base64String1!.replacingOccurrences(of: "+", with: "%2B")
        let url = URL(string: "http://\(IP)/uimage.php")
        
        
       // print(base64String)
            
        
       
            var request = URLRequest(url: url! as URL)
            request.httpMethod = "POST"
            
            
            
            var dataString = "secretWord=44fdcv8jf3" // starting POST string with a secretWord
            
        dataString = dataString + "&image=" + base64String// add items as name and value
            
            
            
        
            
            let dataD = dataString.data(using: .utf8) // convert to utf8 string
            
            do
            {
                
                // the upload task, uploadJob, is defined here
                
                let uploadJob = URLSession.shared.uploadTask(with: request, from: dataD)
                {
                    data, response, error in
                    
                    if error != nil {
                        
                        // display an alert if there is an error inside the DispatchQueue.main.async
                        
                        DispatchQueue.main.async
                            {
                                let alert = UIAlertController(title: "Upload Didn't Work?", message: "Looks like the connection to the server didn't work.  Do you have Internet access?", preferredStyle: .alert)
                                alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                                //  vc.present(alert, animated: true, completion: nil)
                        }
                    }
                    else
                    {
                        if let unwrappedData = data {
                            
                            let returnedData = NSString(data: unwrappedData, encoding: String.Encoding.utf8.rawValue) // Response from web server hosting the database
                            
                            if returnedData == "T" // insert into database worked
                            {
                                
                                
                                DispatchQueue.main.async
                                    {
                                        
                                        
                                }
                            }
                            else
                            {
                                // display an alert if an error and database insert didn't worked (return != 1) inside the DispatchQueue.main.async
                                
                                DispatchQueue.main.async
                                    {
                                        
                                        let alert = UIAlertController(title: "Upload Didn't Work", message: "Looks like the insert into the database did not worked.", preferredStyle: .alert)
                                        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                                        //    vc.present(alert, animated: true, completion: nil)
                                        
                                }
                            }
                        }
                    }
                }
                uploadJob.resume()
            }
            
            
            
            
        
            
            
            
            
            
            
            
            
        
        
        
        
        
        /*
        // generate boundary string using a unique per-app string
        let boundary = UUID().uuidString
        
        let session = URLSession.shared
        
        // Set the URLRequest to POST and to the specified URL
        var urlRequest = URLRequest(url: url!)
        urlRequest.httpMethod = "POST"
        
        // Set Content-Type Header to multipart/form-data, this is equivalent to submitting form data with file upload in a web browser
        // And the boundary is also set here
        urlRequest.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        
        var data = Data()
        
        // Add the image data to the raw http request data
        data.append("\r\n--\(boundary)\r\n".data(using: .utf8)!)
        data.append("Content-Disposition: form-data; name=\"\(paramName)\"; filename=\"\(fileName)\"\r\n".data(using: .utf8)!)
        data.append("Content-Type: image/png\r\n\r\n".data(using: .utf8)!)
        data.append(UIImagePNGRepresentation(image)!)
        
        
        data.append("\r\n--\(boundary)--\r\n".data(using: .utf8)!)
        
        // Send a POST request to the URL, with the data we created earlier
        session.uploadTask(with: urlRequest, from: data, completionHandler: { responseData, response, error in
            if error == nil {
                let jsonData = try? JSONSerialization.jsonObject(with: responseData!, options: .allowFragments)
                if let json = jsonData as? [String: Any] {
                    print(json)
                }
            }
        }).resume()
        */
        
    }
        

    
}
    
    

