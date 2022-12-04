//
//  PublicationsListVM.swift
//  GreenGarden
//
//  Created by Proyectos y Soluciones T.I on 3/12/22.
//

import Foundation

@MainActor
class PublicationsListVM: ObservableObject {
        
    @Published var publications: [PublicationsViewModel] = []
    
    func getAll(id: Int) async {
        
        do {
            let vegetables = try await Webservice().getAllPublications(id: id)
            self.publications = vegetables.map(PublicationsViewModel.init)
        } catch {
            print(error)
        }
    }
}

struct PublicationsViewModel {
    
    fileprivate let publication: PublicationsDTO
    
    var id: Int {
        publication.id
    }
    
    var userId: Int {
        publication.userId
    }
    
    var title: String {
        publication.title
    }
    
    var body: String {
        publication.body
    }
}

extension PublicationsViewModel {
    
    static func `default`() -> PublicationsViewModel {
        
        let publications = PublicationsDTO(id: 1, userId: 1, title: "Title", body: "bosy")
        
        return PublicationsViewModel(publication: publications)
        
    }
    
}
