//
//  CardCreatorView.swift
//  Business Card Builder
//
//  Created by Don Bouncy on 14/06/2022.
//

import SwiftUI
import PhotosUI

struct CardCreatorView: View {
    @State var name: String = ""
    @State var position: String = ""
    @State var number: String = ""
    @State var email: String = ""
    @State var bgColor = Color(.sRGB, red: 0, green: 0, blue: 0)
    @State var txtColor = Color(.sRGB, red: 0, green: 0, blue: 0)
    @State private var image: Image?
    @State private var filterIntensity = 0.5
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
   @Environment(\.presentationMode) var presentationMode
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
    }
    
    init(){
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.red]
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.black]
    }
    
    var body: some View {
        NavigationView{
            VStack {
                Text("Details")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color(red: 0.251, green: 0.251, blue: 0.251))
                ZStack {
                    Rectangle()
                        .fill(.ultraThinMaterial)
                    
                    Text("Tap to select a picture")
                        .foregroundColor(.black)
                        .font(.headline)
                    
                    image?
                        .resizable()
                        .scaledToFit()
                }
                .onTapGesture {
                    showingImagePicker = true
                }
                
                TextField("Name", text: $name, prompt: Text("Full Name"))
                    .frame(height: 30.0)
                    .textInputAutocapitalization(.words)
                    .textFieldStyle(.roundedBorder)
                    .padding(.all)
                
                TextField("Position", text: $position, prompt: Text("Position"))
                    .frame(height: 30.0)
                    .textFieldStyle(.roundedBorder)
                    .padding(.all)
                
                
                TextField("Number", text: $number, prompt: Text("Number"))
                    .frame(height: 30.0)
                    .textFieldStyle(.roundedBorder)
                    .padding(.all)
                
                
                TextField("Email", text: $email, prompt: Text("Email"))
                    .frame(height: 30.0)
                    .disableAutocorrection(true)
                    .textInputAutocapitalization(.never)
                    .textFieldStyle(.roundedBorder)
                    .padding(.all)
                
                ColorPicker("Font color", selection: $txtColor)
                    .padding(.all)
                
                ColorPicker("Background color", selection: $bgColor)
                    .padding(.all)
                
                NavigationLink(destination: GeneratedTemplateView(name: self.name, position: self.position, number: self.number, email: self.email, bgColor: self.bgColor, img: self.image ?? Image("me"), txtColor: self.txtColor)) {
                    Text("Create Template")
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .padding(.all)
                        .background(Color(red: 0, green: 0, blue: 0, opacity: 0.75))
                }
                Spacer()
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(
                leading:
                    Button(action:{
                        withAnimation {
                            presentationMode.wrappedValue.dismiss()
                        }
                    }){
                        HStack {
                            Image(systemName: "chevron.backward")
                                .foregroundColor(.black)
                            Text("Back")
                                .foregroundColor(.black)
                        }
                    }
            )
        }.sheet(isPresented: $showingImagePicker) {
            ImagePicker(image: $inputImage)
        }
        
        .onChange(of: inputImage) { _ in loadImage() }
    }
}

struct CardCreatorView_Previews: PreviewProvider {
    static var previews: some View {
        CardCreatorView()
    }
}
