//
//  InfoView.swift
//  Business Card Builder
//
//  Created by Don Bouncy on 08/10/2022.
//

import SwiftUI

struct InfoView: View {
    let text: String
    let imageName: String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 30)
            .fill(Color.white)
            .frame(height: 50.0)
            .overlay(
                HStack {
                    Image(systemName: imageName)
                        .foregroundColor(.green)
                    Text(text)
                }
            )
            .padding(.all)
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView(text: "me", imageName: "me")
    }
}
