//
//  Webservice.swift
//  GreenGarden
//
//  Created by Mohammad Azam on 7/6/21.
//

import Foundation

enum NetworkError: Error {
    case badUrl
    case invalidRequest
}

class Webservice {
    
    func getAllUsertables(url: URL?) async throws -> [UsertableDTO] {
        
        guard let url = url else {
            throw NetworkError.badUrl
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw NetworkError.invalidRequest
        }
        
        let vegetables = try? JSONDecoder().decode([UsertableDTO].self, from: data)
        return vegetables ?? []
    }
    
    func getAllPublications(id: Int) async throws -> [PublicationsDTO] {
        
        let parameters = [
            "userId": id
        ]
        var avatarURLComponents = URLComponents(string: "https://jsonplaceholder.typicode.com/posts")!
        avatarURLComponents.queryItems = parameters.map({ (key, value) -> URLQueryItem in
            URLQueryItem(name: key, value: String(value))
        })

    
        let (data, response) = try await URLSession.shared.data(from: avatarURLComponents.url!)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw NetworkError.invalidRequest
        }
        
        let vegetables = try? JSONDecoder().decode([PublicationsDTO].self, from: data)
        return vegetables ?? []
    }
    
}
