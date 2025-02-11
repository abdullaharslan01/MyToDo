//
//  SideBarHeaderView.swift
//  ToDoList
//
//  Created by abdullah on 11.02.2025.
//

import SwiftUI

struct SideBarHeaderView: View {
    
    var gmail: String = ""
    
    var body: some View {
       
       
            
            VStack(alignment: .leading) {
                Image("user")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(.circle)
                
                Text(gmail)
                    .font(.callout)
                    .foregroundStyle(.page)
                    
            }.frame(maxWidth: .infinity,alignment: .leading)
            .foregroundStyle(.event)
            
            
          
            
        
        
    }
}

#Preview {
    SideBarHeaderView(gmail: "abdullaharslan1473@gmail.com")
}
