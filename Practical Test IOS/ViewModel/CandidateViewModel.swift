//
//  CandidateViewModel.swift
//  Practical Test IOS
//
//  Created by Imalka Muthukumara on 2021-12-07.
//

import Foundation


class CandidatesViewModel {
    
    private var apiService = ApiService()
    private var candidate = [Candidate]()
    
    func fetchCandidatesData(completion: @escaping () -> ()) {
        
        // weak self - prevent retain cycles
        apiService.getCandidatesData { [weak self] (result) in
            
            switch result {
            case .success(let listOf):
                self?.candidate = listOf.candidate
                completion()
            case .failure(let error):
                // Something is wrong with the JSON file or the model
                print("Error processing json data: \(error)")
            }
        }
    }
    
    func numberOfRowsInSection(section: Int) -> Int {
        if candidate.count != 0 {
            return candidate.count
        }
        return 0
    }
    
    func cellForRowAt (indexPath: IndexPath) -> Candidate {
        return candidate[indexPath.row]
    }
}
