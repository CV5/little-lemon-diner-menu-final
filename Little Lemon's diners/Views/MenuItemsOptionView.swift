//
//  MenuItemsOptionView.swift
//  Little Lemon's diners
//
//  Created by Cristian  Veras on 25/8/23.
//

import SwiftUI



struct MenuItemsOptionView: View {
    @Environment(\.presentationMode) var prestantionMode
    @EnvironmentObject var viewModel: MenuViewViewModel

    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Selected Categories")) {
//                    ForEach(MenuCategory.allCases, id: \.rawValue) { item in
//                               Text(item.rawValue)
//                           }
                    Toggle(MenuCategory.food.rawValue,isOn: $viewModel.isShowFood)
                    Toggle(MenuCategory.drink.rawValue,isOn: $viewModel.isShowDrinks)
                    Toggle(MenuCategory.dessert.rawValue,isOn: $viewModel.isShowDesserts)
                        
                    
                    
                    
                    }
                Section(header: Text("sort by")) {
                    Picker("Sort By", selection: $viewModel.sortBy) {
                        ForEach(SortBy.allCases, id: \.rawValue) { item in
                            Text(item.rawValue).tag(item)
                            
                        }
                    }
                    .pickerStyle(.inline)
                    .listStyle(.grouped)
                    }
            }.navigationTitle("Filter")
                .toolbar{
//                    NavigationLink(destination: Text("Holaaa")) {
                        Button(action: {
                            viewModel.updateMenuItems()
                            prestantionMode.wrappedValue.dismiss()
                        }) {
                            Text("Done")
                        }
//                    }
                }

        }
    }
}

struct MenuItemsOptionView_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemsOptionView().environmentObject(MenuViewViewModel())
    }
}
