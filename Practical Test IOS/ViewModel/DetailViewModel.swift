//
//  DetailViewModel.swift
//  Practical Test IOS
//
//  Created by Imalka Muthukumara on 2021-12-08.
//

import Foundation
import UIKit


class DetailViewModel {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    func updateCandidateStatus(candidate: CandidateDetails, isSelected: Bool) {
        
        candidate.isSelected = isSelected
        
        do {
            try context.save()
        } catch  {
            //
        }
       
    }
}
