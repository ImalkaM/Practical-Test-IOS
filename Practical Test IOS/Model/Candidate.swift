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

struct Location: Decodable {
    
    let street: Street?
    let city: String?
    let state: String?
    let postcode: StringOrInt
    
    private enum CodingKeys:String,CodingKey {
        case street,city,state,postcode
    }
}

struct Street: Decodable {
    
    let number: Int?
    let name: String?
    
    private enum CodingKeys:String,CodingKey {
        case number,name
    }
}

enum StringOrInt: Decodable {
    
    case string(String)
    case int(Int)
    
    init(from decoder: Decoder) throws {
        if let int = try? decoder.singleValueContainer().decode(Int.self) {
            self = .int(int)
            return
        }
        if let string = try? decoder.singleValueContainer().decode(String.self) {
            self = .string(string)
            return
        }
        throw Error.couldNotFindStringOrDouble
    }
    enum Error: Swift.Error {
        case couldNotFindStringOrDouble
    }
}
