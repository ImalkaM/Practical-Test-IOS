//
//  Candidate.swift
//  Practical Test IOS
//
//  Created by Imalka Muthukumara on 2021-12-07.
//

import Foundation

struct CandidateData: Decodable {
    let candidate: [Candidate]
    
    private enum CodingKeys: String, CodingKey {
        case candidate = "results"
    }
}

struct Candidate: Decodable {
    let name: Name?
    let dob: BirthYear?
    let picture:Picture?
    let location:Location?
    let email:String?
    let phoneNumber:String?
    
    private enum CodingKeys: String, CodingKey {
        case name
        case picture
        case dob
        case location
        case email
        case phoneNumber = "phone"
    }
}

