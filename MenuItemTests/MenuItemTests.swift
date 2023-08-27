//
//  MenuItemTests.swift
//  MenuItemTests
//
//  Created by Cristian  Veras on 26/8/23.
//

import XCTest
@testable import Little_Lemon_s_diners

final class MenuItemTests: XCTestCase {
    
    var viewmodel = MenuViewViewModel()
    func test_Checktitle(){
        let food = viewmodel.MockFoodMenuItems[0]
        XCTAssertEqual(food.title, "Food 1")
        }
    
    func test_CheckIngredients(){
        let food = viewmodel.MockFoodMenuItems[0]
        XCTAssertEqual(food.ingredient,[.tomatoSauce, .carrot])
        }
        
    }
    
