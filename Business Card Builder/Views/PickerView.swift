//
//  PickerView.swift
//  Business Card Builder
//
//  Created by Don Bouncy on 08/10/2022.
//

import SwiftUI

enum Selection: String, CaseIterable, Identifiable{
    var id: Self {self}
    case template, create
}

struct PickerView: View {
    @State var selection: Selection = .create
    var body: some View {
        VStack {
            Text("Business Card Builder")
                .font(.title)
                .fontWeight(.bold)
                .padding(.top)
            
            Picker("Selection", selection: $selection) {
                Text("Create Card").tag(Selection.create)
                Text("Template").tag(Selection.template)
            }.pickerStyle(SegmentedPickerStyle())
                .padding(.horizontal)
            
            if selection == .create{
                CardCreatorView()
            }else{
                TemplateView()
            }
        }
    }
}

struct PickerView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
