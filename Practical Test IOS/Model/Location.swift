//
//  Location.swift
//  Practical Test IOS
//
//  Created by Imalka Muthukumara on 2021-12-08.
//

import Foundation

struct Location: Decodable {
    
    let street: Street?
    let city: String?
    let state: String?
    let postcode: StringOrInt
    
    private enum CodingKeys:String,CodingKey {
        case street,city,state,postcode
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
