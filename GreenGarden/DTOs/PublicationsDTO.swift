//
//  PublicationsDTO.swift
//  GreenGarden
//
//  Created by Proyectos y Soluciones T.I on 3/12/22.
//

import Foundation

struct PublicationsDTO: Decodable {
    let id: Int
    let userId: Int
    let title: String
    let body: String
    
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case userId = "userId"
        case title = "title"
        case body = "body"
    }
}
