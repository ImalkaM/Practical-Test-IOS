//
//  SelectedViewController.swift
//  Practical Test IOS
//
//  Created by Imalka Muthukumara on 2021-12-07.
//

import UIKit

class SelectedViewController: UIViewController,UITableViewDataSource {
   
    @IBOutlet var selectedTableView: UITableView!
    
    private var viewModel = SelectedViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        let nib =  UINib(nibName: "CandidateTableViewCell", bundle: nil)
        selectedTableView.register(nib, forCellReuseIdentifier: "CandidateTableViewCell")
       
        selectedTableView.dataSource = self
       
    }
    override func viewWillAppear(_ animated: Bool) {
        viewModel.getAllCandidates()
        selectedTableView.reloadData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = selectedTableView.dequeueReusableCell(withIdentifier: "CandidateTableViewCell", for: indexPath) as! CandidateTableViewCell
        
        let candidate = viewModel.cellForRowAt(indexPath: indexPath)
        cell.setCellWithValuesOf(candidate)
        
        return cell
    }
}
