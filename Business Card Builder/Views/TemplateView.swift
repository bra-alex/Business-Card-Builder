//
//  TemplateView.swift
//  Business Card Builder
//
//  Created by Don Bouncy on 14/06/2022.
//

import SwiftUI

struct TemplateView: View {
    var body: some View {
        ZStack {
            Color(red: 0.15, green: 0.68, blue: 0.38)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack {
                Image("me")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 200)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .overlay(
                        Circle().stroke(Color.white, lineWidth: 3)
                    )
                
                Text("Alexander Boakye")
                    .fontWeight(.bold)
                    .padding()
                    .font(Font.custom("Pacifico-Regular", size: 40))
                    .foregroundColor(.white)
                
                Text("iOS Developer")
                    .foregroundColor(.white)
                    .font(.system(size: 25))
                Divider()
                InfoView(text: "+233 12 345 6789", imageName: "phone.fill")
                InfoView(text: "example@example.com", imageName: "envelope.fill")
            }
        }
    }
}

struct TemplateView_Previews: PreviewProvider {
    static var previews: some View {
        TemplateView()
    }
}
