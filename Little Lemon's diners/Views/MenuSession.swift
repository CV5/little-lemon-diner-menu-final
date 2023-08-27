//
//  MenuSession.swift
//  Little Lemon's diners
//
//  Created by Cristian  Veras on 26/8/23.
//

import SwiftUI


struct MenuSection: View {

    
    @EnvironmentObject var viewModel: MenuViewViewModel
    
    init(menuItems: [MenuItem], menuCategory: MenuCategory) {
        self.menuItems = menuItems
        self.menuCategory = menuCategory
    }
    
    var menuItems: [MenuItem]
    
    var menuCategory: MenuCategory
    
  
    
    
    
    let columns = [
                GridItem(.flexible(minimum: 100)),
                GridItem(.flexible(minimum: 100)),
                GridItem(.flexible(minimum: 100))
    ]
    var body: some View {
        
       
            VStack(alignment: .leading) {
                Text(menuCategory.rawValue).font(.title).fontWeight(.medium)
                
              
                LazyVGrid(columns: columns,spacing: 1 ) {
                    ForEach(menuItems, id: \.self) { value in
                        NavigationLink(destination: Text(value.title)) {
                        VStack {
                            Rectangle()
                            Text(value.title)
                        }
                        .frame(height: 120)
                        .foregroundColor(.black)
                    }
                    }
                }
            }.padding()
    }
}

