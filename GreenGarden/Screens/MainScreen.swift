//
//  MainScreen.swift
//  GreenGarden
//
//  Created by Mohammad Azam on 7/6/21.
//

import SwiftUI

struct MainScreen: View {
    var body: some View {
        TabView {
            UsertableListScreen()
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Image(systemName: "tree.fill")
                            .foregroundColor(.white)
                    }
                }
                .embedInNavigationView()
                
        }.accentColor(.teal)
        .navigationTitle("Ceiba App")
        
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}
