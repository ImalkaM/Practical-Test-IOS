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
    
    
    private enum CodingKeys: String, CodingKey {
        case name
    }
}

struct Name: Decodable {
    
    let first: String?
    let last: String?
    
    private enum CodingKeys: String, CodingKey {
        case first, last
    }
}
