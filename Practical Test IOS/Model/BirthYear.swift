//
//  BirthYear.swift
//  Practical Test IOS
//
//  Created by Imalka Muthukumara on 2021-12-08.
//

import Foundation

struct BirthYear: Decodable {
    
    let date: String?
    let age: Int?
    
    private enum CodingKeys: String, CodingKey {
        case date,age
    }
}
