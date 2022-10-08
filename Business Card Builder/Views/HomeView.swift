//
//  Home.swift
//  Business Card Builder
//
//  Created by Don Bouncy on 08/10/2022.
//

import SwiftUI

struct HomeView: View {
    @State private var showingCreate = false
    var body: some View {
        if #available(iOS 16.0, *) {
            NavigationStack{
                
                PickerView()
                
            }.toolbar(.hidden)
        } else {
            NavigationView{
                
                PickerView()
                
            }.navigationViewStyle(.stack)
                .navigationBarHidden(true)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
