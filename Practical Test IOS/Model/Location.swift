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


