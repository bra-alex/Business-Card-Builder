//
//  GeneratedTemplateView.swift
//  Business Card Builder
//
//  Created by Don Bouncy on 14/06/2022.
//

import SwiftUI

struct GeneratedTemplateView: View {
    
    let name: String
    let position: String
    let number: String
    let email: String
    let bgColor: Color
    let img: Image
    let txtColor: Color
    
    var body: some View {
        ZStack {
            bgColor
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack {
                img
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 200)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .overlay(
                        Circle().stroke(Color.white, lineWidth: 3)
                    )
                
                Text(name)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding()
                    .font(Font.custom("Pacifico-Regular", size: 40))
                    .foregroundColor(txtColor)
                
                Text(position)
                    .foregroundColor(txtColor)
                    .font(.system(size: 25))
                Divider()
                InfoView(text: "+233 \(number)", imageName: "phone.fill")
                InfoView(text: email, imageName: "envelope.fill")
            }
        }
    }
}

struct GeneratedTemplateView_Previews: PreviewProvider {
    static var previews: some View {
        GeneratedTemplateView(name: "Me", position: "Me", number: "Me", email: "Me", bgColor: Color(red: 0.15, green: 0.68, blue: 0.38), img: Image("me"), txtColor: Color.white)
    }
}
