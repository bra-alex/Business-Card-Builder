//
//  MenuItemView.swift
//  Business Card Builder
//
//  Created by Don Bouncy on 08/10/2022.
//

import SwiftUI

struct MenuItemView: View {
    let text: String
    var body: some View {
        
        RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Corner Radius@*/20.0/*@END_MENU_TOKEN@*/)
            .frame(height: 50.0)
            .foregroundColor(Color(red: 0.961, green: 0.969, blue: 0.961))
            .overlay(
                Text(text)
                    .fontWeight(.bold)
                    .foregroundColor(Color.black)
            )
            .padding()
    }
}

struct MenuItemView_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemView(text: "Hi")
    }
}
