//
//  MenuItemDetailsView.swift
//  Little Lemon's diners
//
//  Created by Cristian  Veras on 27/8/23.
//

import SwiftUI

struct MenuItemDetailsView: View {
    let MenuItem: MenuItem
    var body: some View {
        NavigationView{
            
            VStack(alignment: .center){
                Image("LittleLemonlogo").resizable(resizingMode: .stretch).aspectRatio(contentMode: .fit)
                
                VStack{
                    Text("Price:").font(.title3).fontWeight(.bold)
                    Text(String(format:"%.2f",  MenuItem.price))
                }.padding(1)
                
                
                VStack{
                    Text("Ordered:").font(.title3).fontWeight(.bold)
                    Text("\(MenuItem.ordersCount)")
                }.padding(1)
                
                
                VStack{
                    Text("Ingredient:").font(.title3).fontWeight(.bold)
                    ForEach(MenuItem.ingredient, id: \.self) {
                                          Text($0.rawValue)
                                      }
                    
                }.padding(1)
            }
            .navigationTitle(MenuItem.menuCategory.rawValue)
            .padding([.leading, .trailing], 60)
        }
       
       
        
    }
}

struct MenuItemDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        let menuItem: MenuItem = MenuItem(price: 30.9, title: "prueba", menuCategory: .food, ordersCount: 5, ingredient: [.tomatoSauce, .broccoli, .carrot, .pasta])
        MenuItemDetailsView(MenuItem: menuItem)
    }
}

