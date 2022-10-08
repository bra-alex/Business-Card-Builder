//
//  InputFields.swift
//  Business Card Builder
//
//  Created by Don Bouncy on 08/10/2022.
//

import SwiftUI

struct InputFields: View {
    @State var textFieldInput: String
    @Binding var textType: String
    @State var prompt: String
    var body: some View {
        VStack(alignment: .leading){
            Text(textFieldInput)
                .foregroundColor(.primary)
                .font(.custom("Helvetica", size: 15))
                .fontWeight(.bold)
                .padding([.leading, .top])
            
            
            TextField(prompt, text: $textType)
                .frame(height: 30.0)
                .foregroundColor(.black)
                .autocorrectionDisabled()
                .padding(13.0)
                .background(
                    .white,
                    in: RoundedRectangle(cornerRadius: 15, style: .continuous)
                )
                .overlay(alignment: .leading, content: {
                    RoundedRectangle(cornerRadius: 15, style: .continuous)
                        .stroke(Color.black.opacity(0.5) , lineWidth: 1)
                })
                .padding(.horizontal)
        }
    }
}

struct InputFields_Previews: PreviewProvider {
    static var previews: some View {
        InputFields(textFieldInput: "Name", textType: .constant(""), prompt: "Full Name")
    }
}
