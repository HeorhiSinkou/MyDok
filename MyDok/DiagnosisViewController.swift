//
//  DiagnosisViewController.swift
//  MyDok
//
//  Created by georg syncov on 21.04.17.
//  Copyright © 2017 georg syncov. All rights reserved.!!!!!!!!!!!
//

import UIKit

class DiagnosisViewController:  UIViewController,UITableViewDelegate,UITableViewDataSource, UISearchBarDelegate

{
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    var array = ["Гипертония","Абсцес","Пневмония","Варикозная болезнь нижних конечностей","Ишемическая болезнь сердца","Хроническая почечная недостаточность","Грип","ОРВИ","Трахеит","Артериальная гипертензия 2 ст риск 4","Гипертензия 3 степени риск 3","Хроническая сердечно сосудистая недостаточность"]
    var filtered:[String] = []
    var searchActive: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        filtered = array
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("textdidchange \(searchText)")
        if searchText.characters.count >= 1 {
            filtered = array.filter({$0.contains(searchText)})
            tableView.reloadData()
        }
        else
        {
            filtered = array
            tableView.reloadData()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filtered.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        }
        cell?.textLabel?.text = filtered[indexPath.row]
        return cell!
    }
    
    
    
    //    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
    //        print("end edit")
    //        searchActive = false
    //    }
    //    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
    //        print("cancel")
    //         searchActive = false
    //    }
    //    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    //        print("clicked")
    //        searchActive = false
    //    }
    //    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
    //        print("begin edit")
    //        searchActive = true
    //    }
    
    
}

