//
//  VegetableDetailScreen.swift
//  VegetableDetailScreen
//
//  Created by Mohammad Azam on 7/17/21.
//

import SwiftUI

enum UsertableInfoOptions: CaseIterable {
    case publications
}

extension UsertableInfoOptions {
    var title: String {
        switch self {
            case .publications: return "Publicaciones"
        }
    }
}

struct UsertableDetailScreen: View {
    
    let usertable: UsertableViewModel
    @State private var selection: UsertableInfoOptions = .publications
    
    var body: some View {
        ScrollView {
            
            VStack(alignment: .leading) {
                
                Picker("Select", selection: $selection) {
                    ForEach(UsertableInfoOptions.allCases, id: \.self) { info in
                        Text(info.title).tag(info)
                    }
                }.pickerStyle(.segmented)
                
                switch selection {
                    case .publications:
                        Publications(usertable: usertable)
                }
                
            }
            .navigationTitle(usertable.name)
        }
    }
}

struct UsertableDetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        UsertableDetailScreen(usertable: UsertableViewModel.default())
            .embedInNavigationView()
    }
}
