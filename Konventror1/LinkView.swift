//
//  LinkView.swift
//  Konventror1
//
//  Created by crow on 08/03/2023.
//

import SwiftUI

struct LinkView: View {
    
    let topColor: Color
    let bottomColor: Color
    let headerTitle: String
    let titleImage: String
    
    
    var body: some View {
        ZStack{
            Rectangle()
                .fill(LinearGradient(colors: [topColor, bottomColor], startPoint: .topLeading, endPoint: .bottomTrailing))
                .cornerRadius(7)
            VStack{
                HStack{
                    Text(headerTitle)
                        .font(.title)
                        .bold()
                        .foregroundColor(.white)
                        .padding(30)
                        .opacity(0.8)
                    
                    Spacer()
                }
                Spacer()
                Image(titleImage)
                    .resizable()
                    .frame(width: 60, height: 60)
                    .opacity(0.7)
                    .offset(x: 100, y:0)
            }
        }
        .frame(height: 150)
        .padding(7)
    }
}

struct LinkView_Previews: PreviewProvider {
    static var previews: some View {
        LinkView(topColor: .blue, bottomColor: .green, headerTitle: "Titulok", titleImage: "imageKM")
    }
}
