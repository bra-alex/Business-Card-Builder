//
//  GeneratedTemplateView.swift
//  Business Card Builder
//
//  Created by Don Bouncy on 14/06/2022.
//

import SwiftUI

struct GeneratedTemplateView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    
    var img: UIImage
    var name: String
    var position: String
    var number: String
    var email: String
    var bgColor: Color
    var txtColor: Color
    var btnOpacity = 1.0
    
    var body: some View {
        ZStack {
            bgColor
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack{
                HStack{
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "x.circle.fill")
                            .font(.system(size: 25))
                            .foregroundColor(.white)
                            .background(Color.black)
                            .cornerRadius(25)
                            .padding()
                    }
                    Spacer()
                    
                    Button {
                        let card = Card(context: moc)
                        card.img = "img"
                        card.name = name
                        card.position = position
                        card.number = number
                        card.email = email
                        card.bgColorR = Double(bgColor.components.red)
                        card.bgColorG = Double(bgColor.components.green)
                        card.bgColorB = Double(bgColor.components.blue)
                        card.bgColorA = Double(bgColor.components.alpha)
                        card.txtColor = "txtColor"
                        
                        try? moc.save()
                    } label: {
                        Text("Save")
                            .font(.system(size: 20))
                            .foregroundColor(.white)
                            .padding(.horizontal)
                            .padding(.vertical, 10)
                            .background(Color.primary.opacity(0.7))
                            .cornerRadius(15)
                            .padding(.trailing)
                    }

                }
                Spacer(minLength: 0)
            }
            
            VStack {
                Image(uiImage: img)
                    .resizable()
                    .scaledToFill()
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
        GeneratedTemplateView(img: UIImage(imageLiteralResourceName: "me"), name: "Me", position: "Me", number: "Me", email: "Me", bgColor: Color(red: 0.15, green: 0.68, blue: 0.38), txtColor: Color.white)
    }
}
