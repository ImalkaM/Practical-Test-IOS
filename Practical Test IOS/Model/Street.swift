//
//  Street.swift
//  Practical Test IOS
//
//  Created by Imalka Muthukumara on 2021-12-08.
//

import Foundation


struct Street: Decodable {
    
    let number: Int?
    let name: String?
    
    private enum CodingKeys:String,CodingKey {
        case number,name
    }
}
