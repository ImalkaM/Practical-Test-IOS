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
    //var filteredData = [Candidate]()
    
    
    var models = [CandidateDetails]()
    
    var filteredData = [CandidateDetails]()
    
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
            newUser.firstName = user.name?.first
            newUser.lastName = user.name?.last
            newUser.email = user.email
            newUser.dob = user.dob?.date
            newUser.imageAvatar = user.picture?.medium
            newUser.title = user.name?.title
            
            if let locationNo = user.location?.street?.number{
                newUser.locationNumber = String(locationNo)
            }
            if let city = user.location?.city{
                newUser.city = city
            }
            if let state = user.location?.state{
                newUser.state = state
            }
            
            if let streetName = user.location?.street?.name{
                newUser.streetName = String(streetName)
            }
            if let age = user.dob?.age{
                newUser.age = String(age)
            }
           
        }
        do {
            try context.save()
            print("Success")
            
        } catch {
            print("Error saving: \(error)")
        }
    }
    
    
    func getAllCandidates(){
        do {
            models = try context.fetch(CandidateDetails.fetchRequest())
        } catch  {
            //
        }
    }
    
    func numberOfRowsInSection(section: Int) -> Int {
        if !filteredData.isEmpty{
            return filteredData.count
        }else{
            return models.count
        }
    }
    
    func cellForRowAt (indexPath: IndexPath) -> CandidateDetails {

        if !filteredData.isEmpty{
            return filteredData[indexPath.row]
        }else{
            return models[indexPath.row]
        }
        
    }
    
    func filterSearch(_ query:String){
        filteredData.removeAll()
        for candidate in models{
            if let firstName = candidate.firstName, let lastName = candidate.lastName{
                if firstName.lowercased().starts(with: query.lowercased()) || lastName.lowercased().starts(with: query.lowercased()){
                    filteredData.append(candidate)
                }
            }
        }
    }
}
