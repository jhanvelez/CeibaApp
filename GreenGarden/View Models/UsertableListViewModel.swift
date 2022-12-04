//
//  VegetableListViewModel.swift
//  GreenGarden
//
//  Created by Mohammad Azam on 7/6/21.
//

import Foundation

@MainActor
class UsertableListViewModel: ObservableObject {
    
    @Published var vegetables: [UsertableViewModel] = []
    
    func getAll() async {
        
        do {
            let vegetables = try await Webservice().getAllUsertables(url: Constants.Urls.getAllUsertables)
            self.vegetables = vegetables.map(UsertableViewModel.init)
        } catch {
            print(error)
        }
    }
}

struct UsertableViewModel {
    
    fileprivate let usertable: UsertableDTO
    
    var id: Int {
        usertable.id
    }
    
    var name: String {
        usertable.name
    }
    
    var username: String {
        usertable.username
    }
    
    var phone: String {
        usertable.phone
    }
    
    var email: String {
        usertable.email
    }
}

extension UsertableViewModel {
    
    static func `default`() -> UsertableViewModel {
        
        let usertable = UsertableDTO(id: 1, name: "Jhan", username: "jhanvelwz", email: "jrvelez90@misena.edu.co", phone: "3228148914")
        
        return UsertableViewModel(usertable: usertable)
        
    }
    
}
