//
//  HomeWorker.swift
//  PlayCleanSwift
//
//  Created by Ari Supriatna on 04/09/19.
//  Copyright (c) 2019 Ari Supriatna. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
import Alamofire
import SwiftyJSON

class HomeWorker {
  let MEAL_URL = "https://www.themealdb.com/api/json/v1/1/filter.php"
  
  func fetchFood(request: Home.FetchFoods.Request, handler: @escaping (JSON) -> Void) {
    let params: [String: String] = ["c": request.name]
    
    Alamofire.request(MEAL_URL, method: .get, parameters: params).responseJSON { (response) in
      if response.result.isSuccess {
        let dataMeal: JSON = JSON(response.result.value!)
        let meals = dataMeal["meals"]
        
        handler(meals)
      }
    }
  }
}

//struct Meals {
//  var strMeal: String
//  var idMeal: String
//}
//
//struct Food {
//  var data: [Meals]
//}