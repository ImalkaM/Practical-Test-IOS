//
//  selectedViewModel.swift
//  Practical Test IOS
//
//  Created by Imalka Muthukumara on 2021-12-08.
//

import Foundation
import UIKit
import CoreData

class SelectedViewModel {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var models = [CandidateDetails]()
    
    func updateCandidateStatus(candidate: CandidateDetails, isSelected: Bool) {
        
        candidate.isSelected = isSelected
        
        do {
            try context.save()
        } catch  {
            //
        }
       
    }
    
    func getAllCandidates(){
        
        // Create a fetch request with a compound predicate
        let fetchRequest: NSFetchRequest<CandidateDetails>
        fetchRequest = CandidateDetails.fetchRequest()

        // Create the component predicates
        let predicate = NSPredicate(format: "isSelected == %@", NSNumber(value: true))
        
        fetchRequest.predicate = NSCompoundPredicate(
            andPredicateWithSubpredicates: [
                predicate
            ]
        )
     
        
        do {
            models = try context.fetch(fetchRequest)
        } catch  {
            //
        }
    }
    
    func numberOfRowsInSection(section: Int) -> Int {
            return models.count
    }
    
    func cellForRowAt (indexPath: IndexPath) -> CandidateDetails {

            return models[indexPath.row]
    }
}
