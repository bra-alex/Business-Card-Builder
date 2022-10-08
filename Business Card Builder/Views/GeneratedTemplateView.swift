//
//  GeneratedTemplateView.swift
//  Business Card Builder
//
//  Created by Don Bouncy on 14/06/2022.
//

import SwiftUI

struct GeneratedTemplateView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State var img: UIImage
    @Binding var name: String
    @Binding var position: String
    @Binding var number: String
    @Binding var email: String
    @Binding var bgColor: Color
    @Binding var txtColor: Color
    @State var btnOpacity: Double = 1
    
    var body: some View {
        ZStack {
            bgColor
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack{
                HStack{
                    Button {
                        presentationMode.wrappedValue.dismiss()
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
        GeneratedTemplateView(img: UIImage(imageLiteralResourceName: "me"), name: .constant("Me"), position: .constant("Me"), number: .constant("Me"), email: .constant("Me"), bgColor: .constant(Color(red: 0.15, green: 0.68, blue: 0.38)), txtColor: .constant(Color.white))
    }
}
