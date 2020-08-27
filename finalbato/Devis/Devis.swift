//
//  Devis.swift
//  finalbato
//
//  Created by Ludus Académie on 09/05/2018.
//  Copyright © 2018 Ludus Académie. All rights reserved.
//

import UIKit
import PDFKit
class Devis: UIViewController, UITableViewDataSource, UITableViewDelegate, HomeModelProtocol {
    var feedItems: NSArray = NSArray()
   // var selectedChantier : Model = ChantierModel()
    
    var Devis = [DevisModel]()
    var searchedDevis = [DevisModel]()
    
    
    var searching = false
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    let searchController = UISearchController(searchResultsController: nil)
    
    func itemsDownloaded1(items: NSArray) {
        feedItems = items
      
        for dev in feedItems{
             Devis.append((dev as? DevisModel)!)
        }
        
        self.DevisTableView.reloadData()
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
            return searchedDevis.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var item: DevisModel
       if searching == false {
            item = feedItems[indexPath.row] as! DevisModel
       }
        else{
           item = searchedDevis[indexPath.row]
        }
        let DevisCell = DevisTableView.dequeueReusableCell(withIdentifier: "deviscell") as! DevisTableViewCell
        
      
            
        DevisCell.Devislbl.text = item.IDDevis
        DevisCell.Comlbl.text = item.NomClient
        
        DevisCell.PDFBtnAction = { [unowned self] in
            if #available(iOS 11.0, *) {
                if(item.PDF != "null"){
                    let base64encodedstring = item.PDF
                    
                    let decodedData = Data(base64Encoded: base64encodedstring!, options: Data.Base64DecodingOptions.ignoreUnknownCharacters)!
                    let pdfView = PDFView(frame: self.view.bounds)
                    pdfView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
                    //DevisCell.contentView.addSubview(pdfView)
                     self.view.addSubview(pdfView)
                    pdfView.autoScales = true
                    
                    pdfView.document = PDFDocument(data: decodedData)
                    pdfView.isUserInteractionEnabled = true
                    pdfView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.PDFTapped)))
                }
            } else {
                DevisCell.Comlbl.text = "pas une version assez récente pour afficher le pdf"
            }
            
        }
        
  
        
        
        
        
        return DevisCell
        
    }
    

    @IBOutlet weak var DevisTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        self.DevisTableView.estimatedRowHeight = 40;
        self.DevisTableView.rowHeight = UITableViewAutomaticDimension;
        
        DevisTableView.delegate = self
        DevisTableView.dataSource = self
        
        let homeModel = HomeModel()
        homeModel.delegate = self
        homeModel.downloadItems(de: "devis")

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @objc func PDFTapped(gesture: UIGestureRecognizer) {
        if #available(iOS 11.0, *) {
            let PDFTouched = gesture.view as! PDFView
            PDFTouched.removeFromSuperview()
        } else {
            print("operation impossible")
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension Devis: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
      
        searchedDevis = Devis.filter{
            
            
            $0.NomClient.prefix(searchText.count) == searchText
            
        }
        
        
        
        searching = true
        self.DevisTableView.reloadData()
        
        
        
        
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        searchBar.text = ""
        self.DevisTableView.reloadData()
    }
}
