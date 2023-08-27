//
//  MenuItem.swift
//  Little Lemon's diners
//
//  Created by Cristian  Veras on 26/8/23.
//

import Foundation
protocol MenuItemProtocol{
    var id: UUID { get }
    var price:Double { get }
    var title:String { get }
    var menuCategory:MenuCategory { get }
    var ordersCount: Int { get set }
    var ingredient:[Ingredient] { get set }
}

struct MenuItem: Identifiable, Hashable, MenuItemProtocol {
    var price: Double
    var title: String
    var menuCategory: MenuCategory
    var ordersCount: Int
    var ingredient:  [Ingredient]
    var id = UUID()
 
}
