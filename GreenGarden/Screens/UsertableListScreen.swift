//
//  VegetableListScreen.swift
//  GreenGarden
//
//  Created by Mohammad Azam on 7/6/21.
//

import SwiftUI

struct UsertableListScreen: View {
    
    @StateObject private var usertableListVM = UsertableListViewModel()
    
    var body: some View {
        VStack {
            List {
                ForEach(usertableListVM.vegetables, id: \.id) { usertable in
                    
                    NavigationLink(destination: UsertableDetailScreen(usertable: usertable)) {
                       
                        VegetableCell(vegetable: usertable)
                            .background(Constants.Colors.lightGreyRowColor)
                            .clipShape(RoundedRectangle(cornerRadius: 25.0, style: .continuous))
                    }
                    
                }.listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            .navigationTitle("Ceiba App")
            .task {
                await usertableListVM.getAll()
            }
        }
    }
}

struct UsertableListScreen_Previews: PreviewProvider {
    static var previews: some View {
        UsertableListScreen()
            .navigationTitle("Ceiba App")
            .embedInNavigationView()
    }
}

struct VegetableCell: View {
    
    let vegetable: UsertableViewModel
    
    var body: some View {
        HStack {
            
            VStack (alignment: .leading) {
                Image(systemName: "person.fill")
                    .resizable()
                    .frame(width: 60, height: 60)
                    .clipShape(Circle())
            }.frame(width: 60)
            
            VStack (alignment: .leading) {
                Text(vegetable.name)
                    .font(.custom("Arial", size: 15))
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                
                HStack{
                    Image(systemName: "phone.fill")
                    
                    Text(vegetable.phone)
                        .font(.custom("Arial", size: 15))
                }.padding(.top, 1)
                
                HStack{
                    Image(systemName: "envelope.fill")
                    
                    Text(vegetable.email)
                        .font(.custom("Arial", size: 15))
                }
            }.frame(width: 200)
        }
        .padding(5)
        .textFieldStyle(.roundedBorder)
        .frame(maxWidth: .infinity)
    }
}
