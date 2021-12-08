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

    @NSManaged public var firstName: String?
    @NSManaged public var age: String?
    @NSManaged public var tpNo: String?
    @NSManaged public var email: String?
    @NSManaged public var dob: String?
    @NSManaged public var imageAvatar: String?
    @NSManaged public var lastName: String?
    @NSManaged public var title: String?
    @NSManaged public var isSelected: Bool
    @NSManaged public var locationNumber: String?
    @NSManaged public var streetName: String?
    @NSManaged public var city: String?
    @NSManaged public var state: String?
    @NSManaged public var zip: String?

}
