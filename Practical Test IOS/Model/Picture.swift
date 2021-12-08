//
//  Picture.swift
//  Practical Test IOS
//
//  Created by Imalka Muthukumara on 2021-12-08.
//

import Foundation

struct Picture: Decodable {
    let large: String?
    let medium: String?
    let thumbnail: String?
    
    private enum CodingKeys: String, CodingKey {
        case large, medium,thumbnail
    }
}
