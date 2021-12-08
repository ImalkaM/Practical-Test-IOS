//
//  CandidateViewModel.swift
//  Practical Test IOS
//
//  Created by Imalka Muthukumara on 2021-12-07.
//

import Foundation
import UIKit


class CandidatesViewModel {
    
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    private var apiService = ApiService()
    var candidateData = [Candidate]()
    var filteredData = [Candidate]()
    private var filtered = false
    
    func fetchCandidatesData(completion: @escaping () -> ()) {
        
        // weak self - prevent retain cycles
        apiService.getCandidatesData { [weak self] (result) in
            
            switch result {
            case .success(let listOf):
                self?.candidateData = listOf.candidate
                self?.saveUserData()
                completion()
            case .failure(let error):
                // Something is wrong with the JSON file or the model
                print("Error processing json data: \(error)")
            }
        }
    }
    
    func saveUserData() {
        for user in candidateData {
            let newUser = CandidateDetails(context: context)
            newUser.name = (user.name?.first)
        }
        do {
            try context.save()
            print("Success")
            
        } catch {
            print("Error saving: \(error)")
        }
    }
    
    func numberOfRowsInSection(section: Int) -> Int {
        
        if !filteredData.isEmpty{
            return filteredData.count
        }else{
            return candidateData.count
        }
    }
    
    func cellForRowAt (indexPath: IndexPath) -> Candidate {
        if !filteredData.isEmpty{
            return filteredData[indexPath.row]
        }else{
           return candidateData[indexPath.row]
        }
    }
    
    func filterSearch(_ query:String){
        filteredData.removeAll()
        for candidate in candidateData{
            if let firstName = candidate.name?.first, let lastName = candidate.name?.last{
                if firstName.lowercased().starts(with: query.lowercased()) || lastName.lowercased().starts(with: query.lowercased()){
                    filteredData.append(candidate)
                }
            }
        }
    }
}
