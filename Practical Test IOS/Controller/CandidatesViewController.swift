//
//  CandidatesViewController.swift
//  Practical Test IOS
//
//  Created by Imalka Muthukumara on 2021-12-07.
//

import UIKit

class CandidatesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate ,UISearchBarDelegate{
   
    
    @IBOutlet var searchBar: UISearchBar!
    
    @IBOutlet var candidateDetailsTableView: UITableView!
    
    private var viewModel = CandidatesViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadCandidatesData()
        let nib =  UINib(nibName: "CandidateTableViewCell", bundle: nil)
        
        candidateDetailsTableView.register(nib, forCellReuseIdentifier: "CandidateTableViewCell")

        searchBar.delegate = self
        
        candidateDetailsTableView.delegate = self
       
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
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText == ""{
            viewModel.filteredData = viewModel.candidateData
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
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 1: try loading the "Detail" view controller and typecasting it to be DetailViewController
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            // 2: success! Set its selectedImage property
//            vc.selectedImage = pictures[indexPath.row]
//            vc.imageCountDetails = ["currentNumber":indexPath.row + 1]
//            vc.imageCountDetails = ["Count":pictures.count]

            // 3: now push it onto the navigation controller
            navigationController?.pushViewController(vc, animated: true)
        }
    }

}
