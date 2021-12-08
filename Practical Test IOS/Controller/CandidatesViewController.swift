//
//  CandidatesViewController.swift
//  Practical Test IOS
//
//  Created by Imalka Muthukumara on 2021-12-07.
//

import UIKit

class CandidatesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    

    @IBOutlet var searchBar: UITextField!
    
    @IBOutlet var candidateDetailsTableView: UITableView!
    
    private var viewModel = CandidatesViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        loadCandidatesData()
        let nib =  UINib(nibName: "CandidateTableViewCell", bundle: nil)
        
        candidateDetailsTableView.register(nib, forCellReuseIdentifier: "CandidateTableViewCell")

        candidateDetailsTableView.delegate = self
       // candidateDetailsTableView.dataSource = self
       
    }
    
    private func loadCandidatesData() {
        viewModel.fetchCandidatesData { [weak self] in
            self?.candidateDetailsTableView.dataSource = self
            self?.candidateDetailsTableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = candidateDetailsTableView.dequeueReusableCell(withIdentifier: "CandidateTableViewCell", for: indexPath) as! CandidateTableViewCell
        
        let candidate = viewModel.cellForRowAt(indexPath: indexPath)
        cell.setCellWithValuesOf(candidate)
        
        return cell
    }
    
}
