//
//  ContentView.swift
//  Business Card Builder
//
//  Created by Don Bouncy on 14/06/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var showingCreate = false
    var body: some View {
        VStack {
            NavigationView {
                VStack {
                    
                    MenuItemView(text: "Create Business Card")
                        .onTapGesture {
                            showingCreate.toggle()
                        }
                    
                    NavigationLink(destination: TemplateView()) {
                        MenuItemView(text: "View Template")
                    }
                }
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        VStack {
                            Text("Business Card Generator")
                                .font(.title)
                                .fontWeight(.bold)
                                .multilineTextAlignment(.center)
                        }
                    }
                }
                .fullScreenCover(isPresented: $showingCreate, content: CardCreatorView.init)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

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
