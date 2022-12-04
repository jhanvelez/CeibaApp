//
//  DescriptionView.swift
//  GreenYard
//
//  Created by Mohammad Azam on 7/7/21.
//

import SwiftUI

struct PublicationsList: View {
    
    let heading: String
    let content: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(heading)
                .font(.headline)
            Text(content)
                .fixedSize(horizontal: false, vertical: true)
        }.frame(width: .infinity)
    }
}

struct PublicationsList_Previews: PreviewProvider {
    static var previews: some View {
        PublicationsList(heading: "Sowing", content: "Avocado trees usually requires water 2-3 times per week. Put mulch around the trees to make sure that the moisture stays inside the soil. Nitrogen rich fertilizers can also be applied to the tree in batches of 1/2 - 1 pound.")
    }
}
