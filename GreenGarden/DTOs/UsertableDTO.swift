//
//  Vegetable.swift
//  GreenGarden
//
//  Created by Proyectos y Soluciones T.I on 3/12/22.
//

import Foundation

struct UsertableDTO: Decodable {
    let id: Int
    let name: String
    let username: String
    let email: String
    let phone: String
    
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case username = "username"
        case email = "email"
        case phone = "phone"
    }
}
