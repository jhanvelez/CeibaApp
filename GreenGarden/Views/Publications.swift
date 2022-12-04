//
//  AboutUs.swift
//  AboutUs
//
//  Created by Mohammad Azam on 7/17/21.
//

import SwiftUI

struct Publications: View {
    
    let usertable: UsertableViewModel
    
    @StateObject private var PublicationsListMV = PublicationsListVM()
    

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            
            HStack{
                Image(systemName: "person.circle")
                Text(usertable.username)
            }.padding(.top, 1)
            
            HStack{
                Image(systemName: "phone.fill")
                Text(usertable.phone)
            }
            
            HStack{
                Image(systemName: "envelope.fill")
                Text(usertable.email)
            }
            
            Divider()
            
            Text("Listado de publicaciones")
                    .font(.headline)
        }.padding()

        NavigationView {
            List {
                ForEach(PublicationsListMV.publications, id: \.id) { publication in
                
                    VStack(alignment: .leading) {
                        Text(publication.title)
                            .font(.headline)
                        Text(publication.body)
                            .fixedSize(horizontal: false, vertical: true)
                            .padding(.top, 5)
                    }.frame(width: .infinity)
                }
            }
            .task {
                await PublicationsListMV.getAll(id: usertable.id)
            }
            .padding(.bottom, 100)
        }
    }
}

struct AboutUs_Previews: PreviewProvider {
    static var previews: some View {
        Publications(usertable: UsertableViewModel.default())
    }
}
