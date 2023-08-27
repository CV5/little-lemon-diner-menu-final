//
//  MenuViewViewModel.swift
//  Little Lemon's diners
//
//  Created by Cristian  Veras on 26/8/23.
//

import Foundation
class MenuViewViewModel: ObservableObject{
    //Food menu items
    @Published var MockFoodMenuItems: [MenuItem] = [
        MenuItem(price: 30.0, title: "Food 1", menuCategory: .food, ordersCount: 10, ingredient: [.tomatoSauce, .carrot]),
        MenuItem(price: 10.0, title: "Food 2", menuCategory: .food, ordersCount: 5, ingredient: [.pasta]),
        MenuItem(price: 15.0, title: "Food 3", menuCategory: .food, ordersCount: 6, ingredient: [.broccoli, .carrot]),
        MenuItem(price: 25.0, title: "Food 4", menuCategory: .food, ordersCount: 2, ingredient: [.spinach]),
        MenuItem(price: 45.0, title: "Food 5", menuCategory: .food, ordersCount: 1, ingredient: [.broccoli]),
        MenuItem(price: 05.0, title: "Food 6", menuCategory: .food, ordersCount: 59, ingredient: [.tomatoSauce]),
        MenuItem(price: 20.0, title: "Food 7", menuCategory: .food, ordersCount: 1, ingredient: [.broccoli]),
        MenuItem(price: 22.0, title: "Food 8", menuCategory: .food, ordersCount: 8, ingredient: [.tomatoSauce,.spinach]),
        MenuItem(price: 23.0, title: "Food 9", menuCategory: .food, ordersCount: 6, ingredient: [.tomatoSauce, .broccoli]),
        MenuItem(price: 19.0, title: "Food 10", menuCategory: .food, ordersCount: 4, ingredient: [.tomatoSauce, .pasta]),
        MenuItem(price: 86.0, title: "Food 11", menuCategory: .food, ordersCount: 2, ingredient: [.tomatoSauce, .carrot]),
        MenuItem(price: 50.5, title: "Food 12", menuCategory: .food, ordersCount: 3, ingredient: [.tomatoSauce, .carrot])

    ]
    
    //Drink menu items
    @Published var MockDrinksMenuItems:[MenuItem] = [
        MenuItem(price: 30.0, title: "Drinks 1", menuCategory: .drink, ordersCount: 10, ingredient: []),
        MenuItem(price: 10.0, title: "Drinks 2", menuCategory: .drink, ordersCount: 5, ingredient: []),
        MenuItem(price: 15.0, title: "Drinks 3", menuCategory: .drink, ordersCount: 8, ingredient: []),
        MenuItem(price: 25.0, title: "Drinks 4", menuCategory: .drink, ordersCount: 2, ingredient: []),
        MenuItem(price: 45.0, title: "Drinks 5", menuCategory: .drink, ordersCount: 3, ingredient: []),
        MenuItem(price: 05.0, title: "Drinks 6", menuCategory: .drink, ordersCount: 5, ingredient: []),
        MenuItem(price: 20.0, title: "Drinks 7", menuCategory: .drink, ordersCount: 6, ingredient: []),
        MenuItem(price: 22.0, title: "Drinks 8", menuCategory: .drink, ordersCount: 9, ingredient: [])

    ]
    
    //Dessert menu items
    @Published var MockDessertsMenuItems: [MenuItem] = [
        MenuItem(price: 15.0, title: "Dessert 1", menuCategory: .dessert, ordersCount: 15, ingredient: []),
        MenuItem(price: 10.0, title: "Dessert 2", menuCategory: .dessert, ordersCount: 20, ingredient: []),
        MenuItem(price: 10.0, title: "Dessert 3", menuCategory: .dessert, ordersCount: 0, ingredient: []),
        MenuItem(price: 18.0, title: "Dessert 4", menuCategory: .dessert, ordersCount: 0, ingredient: [])
    ]
    
    
    @Published var isOpenedOptionView = false
    
    @Published var isShowFood = true
    @Published var isShowDrinks = true
    @Published var isShowDesserts = true
    
    @Published var sortBy = SortBy.AZ
    
    
    func updateMenuItems() {
        switch sortBy {
        // Sorting by number of orders
        case .mostPopular:
            MockFoodMenuItems.sort() { $0.ordersCount > $1.ordersCount }
            MockDrinksMenuItems.sort() { $0.ordersCount > $1.ordersCount }
            MockDessertsMenuItems.sort() { $0.ordersCount > $1.ordersCount }
        // Sorting by cost from lowest to highest
        case .fromLowPrice:
            MockFoodMenuItems.sort() { $0.price < $1.price }
            MockDessertsMenuItems.sort() { $0.price < $1.price }
            MockDessertsMenuItems.sort() { $0.price < $1.price }
        // Sort by titles alphabetically and by digits
        case .AZ:
            MockFoodMenuItems.sort(by: {$0.title.lowercased() < $1.title.lowercased()})
            MockDessertsMenuItems.sort(by: {$0.title.lowercased() < $1.title.lowercased()})
            MockDessertsMenuItems.sort(by: {$0.title.lowercased() < $1.title.lowercased()})
        }
    }
    
}
