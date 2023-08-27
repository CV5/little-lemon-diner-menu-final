//
//  MenuItemsView.swift
//  Little Lemon's diners
//
//  Created by Cristian  Veras on 25/8/23.
//

import SwiftUI

struct MenuItemsView: View {
    @StateObject var viewModel: MenuViewViewModel = MenuViewViewModel()
    
    var body: some View {
        NavigationView() {
            ScrollView {
                VStack {
                    
                    if(viewModel.isShowFood){
                        MenuSection(menuItems: viewModel.MockFoodMenuItems, menuCategory: .food)
                    }
                    if (viewModel.isShowDrinks){
                        MenuSection(menuItems: viewModel.MockDrinksMenuItems, menuCategory: .drink)
                    }
                    
                    if(viewModel.isShowDesserts){
                        MenuSection(menuItems: viewModel.MockDessertsMenuItems, menuCategory: .dessert)
                    }
                
                }.onDisappear(){
                    
                    
                }
            } .onAppear() {
                print("Aparecio \(viewModel.isShowFood)")
                viewModel.updateMenuItems()
//                self.viewModel.objectWillChange.send()
            }
            .navigationTitle(Text("Menu"))
            .toolbar(content: {
                NavigationLink(destination: MenuItemsOptionView()){
                    Image(systemName:  "slider.horizontal.3")
                              }
            })
        }
        .environmentObject(viewModel)
    }
}
struct MenuItemsView_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemsView().environmentObject(MenuViewViewModel())
    }
}
