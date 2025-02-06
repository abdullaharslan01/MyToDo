//
//  SelectDateTimeMenuView.swift
//  ToDoList
//
//  Created by abdullah on 06.02.2025.
//

import SwiftUI

struct SelectDateTimeMenuView: View {
    let title: String
    var subTitle: String
    let imageName: String
    
    var onTapGesture: () -> ()
    
    var body: some View {
        
        VStack {
            Text("\(title)")
                .font(.system(size: 16, weight: .semibold))
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundStyle(.black)
                
            Button {
                onTapGesture()
            } label: {
                HStack {
                    Text(subTitle)
                        .foregroundStyle(.tdGray)
                        .font(.callout)
                        .frame(maxWidth: .infinity, alignment: .leading)
                                                                                
                    Image(imageName)
                }.padding()
                    .background(.white, in: .rect(cornerRadius: 6))
            }
                
        }.frame(maxWidth: .infinity, alignment: .leading)
        
    }

}
