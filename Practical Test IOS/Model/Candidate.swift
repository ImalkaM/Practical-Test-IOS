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
    let dob: dob?
    let picture:Picture?
    
    
    private enum CodingKeys: String, CodingKey {
        case name
        case picture
        case dob
    }
}

struct Name: Decodable {
    
    let first: String?
    let last: String?
    
    private enum CodingKeys: String, CodingKey {
        case first, last
    }
}

struct Picture: Decodable {
    let large: String?
    let medium: String?
    let thumbnail: String?
    
    private enum CodingKeys: String, CodingKey {
        case large, medium,thumbnail
    }
}

struct dob: Decodable {
    
    let date: String?
    let age: Int?
    
    private enum CodingKeys: String, CodingKey {
        case date,age
    }
}
