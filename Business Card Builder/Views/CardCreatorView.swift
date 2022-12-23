//
//  CardCreatorView.swift
//  Business Card Builder
//
//  Created by Don Bouncy on 14/06/2022.
//

import SwiftUI
import PhotosUI

struct CardCreatorView: View {
    @State private var showingImagePicker = false
    @State private var generateCard = false
    @State private var image: UIImage?
    @State var name = ""
    @State var position = ""
    @State var number = ""
    @State var email = ""
    @State var bgColor = Color(.sRGB, red: 0, green: 0, blue: 0)
    @State var txtColor = Color(.sRGB, red: 0, green: 0, blue: 0)
    var body: some View {
        
        ScrollView{
            Button {
                showingImagePicker.toggle()
            } label: {
                ZStack{
                    Rectangle()
                        .fill(.ultraThinMaterial)
                        .frame(width: UIScreen.main.bounds.width, height: 250)
                        .padding(.top)
                    
                    Text("Tap to select a picture")
                        .foregroundColor(.primary)
                        .font(.headline)
                    
                    if let image = image{
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFill()
                    }
                }
            }
            .sheet(isPresented: $showingImagePicker) {
                ImagePicker(image: $image)
            }
            
            InputFields(textFieldInput: "Name", textType: $name, prompt: "Full Name")
                .textInputAutocapitalization(.words)
            
            InputFields(textFieldInput: "Position", textType: $position, prompt: "Position")
                .textInputAutocapitalization(.words)
            
            InputFields(textFieldInput: "Number", textType: $number, prompt: "Number")
                .keyboardType(.phonePad)
                .textInputAutocapitalization(.never)
            
            InputFields(textFieldInput: "Email", textType: $email, prompt: "Email")
                .keyboardType(.emailAddress)
                .textInputAutocapitalization(.never)
            
            ColorPicker(selection: $txtColor) {Text("Font Color").fontWeight(.bold)}
                .padding(.all)
            
            ColorPicker(selection: $bgColor){Text("Background color").fontWeight(.bold)}
                .padding(.all)
            
            Button {
                print(txtColor)
                print(bgColor)
//                generateCard.toggle()
            } label: {
                Text("Create Template")
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .padding(.all)
                    .background(Color(red: 0, green: 0, blue: 0, opacity: 0.75))
            }.padding(.top)
        }
        .fullScreenCover(isPresented: $generateCard) {
            GeneratedTemplateView(img: image ?? UIImage(), name: name, position: position, number: number, email: email, bgColor: bgColor, txtColor: txtColor)
        }
    }
}

struct CardCreatorView_Previews: PreviewProvider {
    static var previews: some View {
        CardCreatorView()
    }
}


