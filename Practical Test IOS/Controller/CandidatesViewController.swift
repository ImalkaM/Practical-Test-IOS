//
//  CandidatesViewController.swift
//  Practical Test IOS
//
//  Created by Imalka Muthukumara on 2021-12-07.
//

import UIKit

class CandidatesViewController: UIViewController{
   
    @IBOutlet var searchBar: UISearchBar!
    
    @IBOutlet var candidateDetailsTableView: UITableView!
    
    private var viewModel = CandidatesViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewSetup()
        loadCandidatesData()
        setupSearchBar()
       
    }
    
    private func loadCandidatesData() {
        viewModel.fetchCandidatesData { [weak self] in
            self?.viewModel.getAllCandidates(completion: {
                self?.candidateDetailsTableView.dataSource = self
                self?.candidateDetailsTableView.reloadData()
            })
           
        }
    }

}

extension CandidatesViewController:UITableViewDelegate, UITableViewDataSource{
    
    private func tableViewSetup() {
        let nib =  UINib(nibName: "CandidateTableViewCell", bundle: nil)
        candidateDetailsTableView.register(nib, forCellReuseIdentifier: "CandidateTableViewCell")
        candidateDetailsTableView.dataSource = self
        candidateDetailsTableView.delegate = self
        title = "Candidates"
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 1: try loading the "Detail" view controller and typecasting it to be DetailViewController
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            
            let candidate = viewModel.cellForRowAt(indexPath: indexPath)
            
            
            vc.candidate = candidate
            
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}

extension CandidatesViewController:UISearchBarDelegate{
    
    func setupSearchBar(){
        searchBar.delegate = self
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText == ""{
            viewModel.filteredData = viewModel.models
            candidateDetailsTableView.reloadData()
        }else{
            if let searchText = searchBar.text{
                if searchText.count >= 3{
                    viewModel.filterSearch(searchText)
                    candidateDetailsTableView.reloadData()
                }
            }
        }
       
    }
}
