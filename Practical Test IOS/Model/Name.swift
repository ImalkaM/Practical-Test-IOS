//
//  Name.swift
//  Practical Test IOS
//
//  Created by Imalka Muthukumara on 2021-12-08.
//

import Foundation

struct Name: Decodable {
    
    let title: String?
    let first: String?
    let last: String?
    
    private enum CodingKeys: String, CodingKey {
        case first, last, title
    }
}
