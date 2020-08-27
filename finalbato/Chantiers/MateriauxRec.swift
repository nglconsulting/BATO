//
//  MateriauxRec.swift
//  finalbato
//
//  Created by Ludus Académie on 03/12/2019.
//  Copyright © 2019 Ludus Académie. All rights reserved.
//

import UIKit
import PDFKit

class MateriauxRec: UIViewController, UITableViewDataSource, UITableViewDelegate, HomeModelProtocol {
    var future = "placeholder"
    var IDChantier = "placeholder"
    var searching=false
    var materiaux = [MateriauModel]()
    var searchedMateriaux = [MateriauModel]()
    
    @IBOutlet weak var MateriauxRecTableView: UITableView!
    var feedItems: NSArray = NSArray()
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var Totallbl: UILabel!
    @IBOutlet weak var TotalPAlbl: UILabel!
    func itemsDownloaded1(items: NSArray) {
         feedItems = items
        
         var total = 0
        var totalpa = 0
        for mat in feedItems{
            
            
            materiaux.append((mat as? MateriauModel)!)
            let m1 = mat as! MateriauModel
            
            var prixmat = 0
            prixmat = Int(m1.Prix)!*Int(m1.Qte)!
            total+=prixmat
             if global.NomTechnicien=="admin"{
            var prixach = 0
            prixach = Int(m1.PA)!*Int(m1.Qte)!
            totalpa+=prixach
            }
        }
        
       
     
        
        print(total)
        Totallbl.text = String(total)
        if global.NomTechnicien=="admin"{
        TotalPAlbl.text = String(totalpa)
        }
        else{
            TotalPAlbl.text = ""
        }
        self.MateriauxRecTableView.reloadData()
    }
    
    func itemsDownloaded2(items: NSArray) {
        
    }
    
    func itemsDownloaded3(items: NSArray) {
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching==false{
            return feedItems.count
        }
        else
        {
            return searchedMateriaux.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var item: MateriauModel
        if searching == false {
            item = feedItems[indexPath.row] as! MateriauModel
        }
        else{
            item = searchedMateriaux[indexPath.row]
        }
        let MateriauxRecCell = MateriauxRecTableView.dequeueReusableCell(withIdentifier: "MateriauxRecCell") as! MateriauxRecTableViewCell
        
       // MateriauxRecCell.MateriauxReclbl.text = item.Intitule
        MateriauxRecCell.NomTechnicienlbl.text = item.NomTech
        MateriauxRecCell.Qtelbl.text = item.Qte
        MateriauxRecCell.MateriauxReclbl.text = item.Intitule
        var prixmat = 0
        prixmat = Int(item.Prix)!*Int(item.Qte)!
        MateriauxRecCell.Prixlbl.text = "Prix vente: " + String(prixmat) + " €"
         if global.NomTechnicien=="admin"{
        var prixach = 0
        prixach = Int(item.PA)!*Int(item.Qte)!
        MateriauxRecCell.PAlbl.text = "Prix achat: " + String(prixach) + " €"
        }
         else{
            MateriauxRecCell.PAlbl.text = ""
        }
        MateriauxRecCell.DeleteBtnAction = { [unowned self] in
            
            let alert = UIAlertController(title: "Supprimer?", message: "Etes-vous bien sûr de vouloir supprimer cet outil de la liste?", preferredStyle: .alert)
            let ok = UIAlertAction(title: "Oui", style: .cancel, handler:{ action in
                print("ok on upload")
                 self.uploading(to: "materiauxcancel", IDMateriau: item.IDMateriau, IDChantier: self.IDChantier, IDTech: global.IDTechnicien, futur: self.future)
                
            })
            
            alert.addAction(ok)
            let non = (UIAlertAction(title: "Non", style: .default, handler: { action in
                print("annulé")
                
            }))
            alert.addAction(non)
            self.present(alert, animated: true, completion: nil)
            
            
           
            
        }
        
        
        return MateriauxRecCell
        
    }
    
   

    @IBOutlet weak var searchbar: UISearchBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        self.MateriauxRecTableView.estimatedRowHeight = 40;
        self.MateriauxRecTableView.rowHeight = UITableViewAutomaticDimension;
        
        MateriauxRecTableView.delegate = self
        MateriauxRecTableView.dataSource = self
        
        let homeModel = HomeModel()
        homeModel.delegate = self
    
        homeModel.downloadmateriauxrec(de: global.IDTechnicien, sur: self.IDChantier, future: self.future)
        
       
        
        
        // Do any additional setup after loading the view.
    }
    
    func uploading(to: String, IDMateriau: String, IDChantier: String, IDTech: String, futur: String){
        
        let upload = Upload()
        upload.u3(vers: to, message: IDTech, de: IDMateriau, sur: futur,de: "rien", surchantier: IDChantier)
        self.showSpinner(onView: self.view)
        self.MateriauxRecTableView.reloadData()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { // Change `2.0` to the desired number of seconds.
            // Code you want to be delayed
            self.viewDidLoad()
            self.removeSpinner()
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func On_Print_Clic(_ sender: Any) {
        if (global.NomTechnicien=="admin"){
        print("impression")
        let format = UIGraphicsPDFRendererFormat()
        let metaData = [
            kCGPDFContextTitle: "PDF",
            kCGPDFContextAuthor: global.NomTechnicien
          ]
        format.documentInfo = metaData as [String: Any]
        
        let pageRect = CGRect(x: 0, y: 0, width: 595, height: 842)
        let renderer = UIGraphicsPDFRenderer(bounds: pageRect,
                                             format: format)
        
      let data = renderer.pdfData { (context) in
          context.beginPage()
          
          let paragraphStyle = NSMutableParagraphStyle()
          paragraphStyle.alignment = .center
          let attributes = [
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20),
            NSAttributedString.Key.paragraphStyle: paragraphStyle,
            NSAttributedString.Key.backgroundColor: UIColor.lightGray
            /*NSAttributedString.Key.strokeWidth: -3.0,
            NSAttributedString.Key.strokeColor: UIColor.yellow,
            NSAttributedString.Key.foregroundColor: UIColor.red */
            ]
        //création des textes qu'on écrit dans le pdf
        var text = ""
        var y=0
        
        var i = 1
        for materiau in feedItems{
            if i%10==0 {
                context.beginPage()
                y = 0
            }
            i+=1
            let mat = materiau as? MateriauModel
            text = mat?.NomTech ?? "Aucun tech"
            text = text + " "
            text = text + (mat?.Qte ?? "Aucune qte")
            text = text + " "
            text = text + (mat?.Intitule ?? "Aucun nom")
             text = text + " "
           /* var tmp = Int((mat?.Prix)!)
            tmp = tmp! * Int((mat?.Qte)!)!
            //tmp = Int8(mat!.Prix)*Int8(mat!.Qte)
            let tmp2 = String(tmp) */
            text = text + ( mat?.Prix ?? "Aucun prix")
            text = text + "€" + " "
            
            let textRect = CGRect(x: 0, // left margin
                                  y: y, // top margin
                              width: 500,
                             height: 20)
            
            text.draw(in: textRect, withAttributes: attributes)
            y = y+50
        }
        text = "prix total: "
        text = text + (self.Totallbl.text ?? "total manquant")
        text = text + "€"
        var textRect = CGRect(x: 0, // left margin
             y: y, // top margin
         width: 500,
        height: 40)
        let attributes2 = [
          NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 30),
          NSAttributedString.Key.paragraphStyle: paragraphStyle,
          NSAttributedString.Key.backgroundColor: UIColor.red
        ]
        y = y+50
        text.draw(in: textRect, withAttributes: attributes2)
        text = "Prix Unitaire Public total: "
        text = text + (self.TotalPAlbl.text ?? "total manquant")
               text = text + "€"
                textRect = CGRect(x: 0, // left margin
                    y: y, // top margin
                width: 500,
               height: 40)
               
               text.draw(in: textRect, withAttributes: attributes2)
         
        }
        let pdfView = PDFView(frame: self.view.bounds)
                           pdfView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
                           //DevisCell.contentView.addSubview(pdfView)
                            self.view.addSubview(pdfView)
                           pdfView.autoScales = true
                           
                           pdfView.document = PDFDocument(data: data)
        
        pdfView.isUserInteractionEnabled = true
            let resourceDocPath = (FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)).last! as URL
            let pdfNameFromUrl = "finalbato-\test.pdf"
            let actualPath = resourceDocPath.appendingPathComponent(pdfNameFromUrl)
            do {
                try data.write(to: actualPath, options: .atomic)
                print("pdf successfully saved!")
            } catch {
                print("Pdf could not be saved")
            }
      /*  let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let fileURL = documentsDirectory.appendingPathComponent("test.pdf")
        pdfView.document!.write(to: fileURL)
            */
        }//fin du if admin
    }
}

extension MateriauxRec: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    
        searchedMateriaux = materiaux.filter{
            
            
            $0.NomTech.prefix(searchText.count) == searchText
            
        }
        
        
      var  total = 0
        searching = true
        for mat in searchedMateriaux{
            var prixmat = 0
            prixmat = Int(mat.Prix)!*Int(mat.Qte)!
            total+=prixmat
        }
        self.Totallbl.text = String(total)
        self.MateriauxRecTableView.reloadData()
        
        
        
        
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        searchBar.text = ""
        self.MateriauxRecTableView.reloadData()
    }
}
