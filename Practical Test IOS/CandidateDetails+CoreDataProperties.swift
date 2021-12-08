//
//  CandidateDetails+CoreDataProperties.swift
//  Practical Test IOS
//
//  Created by Imalka Muthukumara on 2021-12-08.
//
//

import Foundation
import CoreData


extension CandidateDetails {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CandidateDetails> {
        return NSFetchRequest<CandidateDetails>(entityName: "CandidateDetails")
    }

    @NSManaged public var name: String?
    @NSManaged public var age: String?

}
