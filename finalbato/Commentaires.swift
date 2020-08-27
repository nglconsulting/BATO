//
//  Commentaires.swift
//  finalbato
//
//  Created by Ludus Académie on 14/11/2018.
//  Copyright © 2018 Ludus Académie. All rights reserved.
//

import UIKit

class Commentaires: UIViewController ,UITableViewDataSource, UITableViewDelegate,UIImagePickerControllerDelegate, UINavigationControllerDelegate,UITextFieldDelegate, HomeModelProtocol {

    @IBOutlet weak var Commenttextfield: UITextField!
    @IBOutlet weak var Commentary2Tableview: UITableView!
    var delavue = "client"
    
    
    
    var imagePicker: UIImagePickerController!
    
    var img: UIImage!
    var imageView: UIImageView?
    var imgisfullscreen = false
    
    var feedItems: NSArray = NSArray()
    var IDClient: String = "placeholder"
    override func viewDidLoad() {
        super.viewDidLoad()
        Commenttextfield.delegate = self
        self.Commentary2Tableview.estimatedRowHeight = 40;
        self.Commentary2Tableview.rowHeight = UITableViewAutomaticDimension;
        
        Commentary2Tableview.delegate = self
        Commentary2Tableview.dataSource = self
        
        let homeModel = HomeModel()
        homeModel.delegate = self
        //homeModel.downloadItems(de: "commentaire")
        homeModel.downloadcoms(de: IDClient,sur: delavue)
        //print(IDClient)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func itemsDownloaded1(items: NSArray) {
        
        
        
        
        
        
        
        
    }
    
    func itemsDownloaded3(items: NSArray){
        
        
        feedItems = items
        print(feedItems)
       
        self.Commentary2Tableview.reloadData()
        
        
        
    }
    
    func itemsDownloaded2(items: NSArray) {
        
    }
    

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
         //   print(feedItems.count)
            return feedItems.count
        
      
        
        
    }
    
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Get the location to be shown
        
        //
        super.viewDidLoad()
        
            let item: CommentaireModel = feedItems[indexPath.row] as! CommentaireModel
            let CommentaryCell = Commentary2Tableview.dequeueReusableCell(withIdentifier: "commentary2cell") as! Commentary2TableViewCell
        
      
            // SAVCell.Clientlbl.text = "\(feedItems[indexPath.row])"
        CommentaryCell.Technicien_lbl.text = item.Nom_Technicien
        CommentaryCell.Com_lbl.text = item.TexteCommentaire
        //s'il y a une photo, alors on la décode et on la met dans la cellule
        if(item.photo != "null"){
        let base64encodedstring = item.photo
        
        let decodedData = Data(base64Encoded: base64encodedstring!, options: Data.Base64DecodingOptions.ignoreUnknownCharacters)!
     //   let decodedString = String(data: decodedData, encoding: .utf8)!
        
       
        CommentaryCell.imgtext = UIImage(data: decodedData)!
        CommentaryCell.imgviewtext = UIImageView(image: CommentaryCell.imgtext)
        CommentaryCell.imgviewtext.isUserInteractionEnabled = true
        CommentaryCell.imgviewtext.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(imageTapped)))
        
        
        
       // imgviewtext.frame = CGRect(CommentaryCell.Com_lbl.frame.maxX + 10, y: CommentaryCell.Com_lbl.frame.minY, width: 50, height: 100)
    CommentaryCell.imgviewtext.frame = CGRect(x: CommentaryCell.Technicien_lbl.frame.maxX + 10, y: CommentaryCell.Technicien_lbl.frame.minY, width: 100, height: 200)
        CommentaryCell.contentView .addSubview(CommentaryCell.imgviewtext)
            
      //  view.addSubview(imgviewtext)
            
        }
        
        
        
            return CommentaryCell
       
    }
    
    
    
    @IBAction func BtnComPressed(_ sender: Any) {
   
        
    imagePicker =  UIImagePickerController()
    imagePicker.delegate = self
    imagePicker.sourceType = .photoLibrary
    present(imagePicker, animated: true, completion: nil)
        
        
        
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
       imagePicker.dismiss(animated: true, completion: nil)
        
        let image = info[UIImagePickerControllerOriginalImage] as? UIImage
        img = info[UIImagePickerControllerOriginalImage] as? UIImage
        imageView = UIImageView(image: image!)
        
        imageView!.image = image
        
        imageView!.frame = CGRect(x: Commenttextfield.frame.maxX + 10, y: Commenttextfield.frame.minY, width: 50, height: 100)
        view.addSubview(imageView!)
        
      //  UIImageWriteToSavedPhotosAlbum(image!, nil, nil, nil);
       /* let uploadpic = Upload()
        uploadpic.uimage(fileName: "Test.png", image: image!)
        */
        
        
    }
   
//  Bouton d'envoi
    @IBAction func OnEnvoyerBtn_click(_ sender: Any) {
        let uploadtest = Upload()
        var tableope = "placeholder"
        if(self.delavue=="client"){
            tableope = "commentairec"
        }else{
            tableope = "commentairea"
        }
        uploadtest.u2(vers: tableope,message: Commenttextfield.text!, de: global.IDTechnicien,sur: IDClient, image: img)
     
        Commenttextfield.text = ""
        img = nil
        imageView?.image = nil
        self.showSpinner(onView: self.view)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { // Change `2.0` to the desired number of seconds.
            // Code you want to be delayed
            self.viewDidLoad()
            self.removeSpinner()
        }
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
    }
    //quand on tape sur l'image, elle s'agrandit
    @objc func imageTapped(gesture: UIGestureRecognizer) {
        // if the tapped view is a UIImageView then set it to imageview
        let TappedImage = gesture.view as! UIImageView
        var imgfullscreen = UIImageView(image: TappedImage.image)
        if (!imgisfullscreen) {
            if imgisfullscreen == false {
            
            
            imgfullscreen.isUserInteractionEnabled = true
            imgfullscreen.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(imageDestroy)))
            
            let screenSize: CGRect = UIScreen.main.bounds
            imgfullscreen.frame = CGRect(x: 0, y: 0, width: screenSize.width, height: screenSize.height)
            //Here you can initiate your new ViewController
            self.view.addSubview(imgfullscreen)
                imgisfullscreen = true
            }
            else{
               
            }
        }
    }
    
    
     @objc func imageDestroy(gesture: UIGestureRecognizer){
    // if the tapped view is a UIImageView then set it to imageview
    let TappedImage = gesture.view as! UIImageView
        
        imgisfullscreen = false
        TappedImage.image = nil
        TappedImage.removeFromSuperview()
    
    }
    
     // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
    }
    
    
    
   
    

}

var vSpinner : UIView?

extension UIViewController {
    func showSpinner(onView : UIView) {
        let spinnerView = UIView.init(frame: onView.bounds)
        spinnerView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        let ai = UIActivityIndicatorView.init(activityIndicatorStyle: UIActivityIndicatorViewStyle.large)
        ai.startAnimating()
        ai.center = spinnerView.center
        
        DispatchQueue.main.async {
            spinnerView.addSubview(ai)
            onView.addSubview(spinnerView)
        }
        
        vSpinner = spinnerView
    }
    
    func removeSpinner() {
        DispatchQueue.main.async {
            vSpinner?.removeFromSuperview()
            vSpinner = nil
        }
    }
}


