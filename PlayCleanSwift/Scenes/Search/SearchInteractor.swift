//
//  SearchInteractor.swift
//  PlayCleanSwift
//
//  Created by Ari Supriatna on 05/09/19.
//  Copyright (c) 2019 Ari Supriatna. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol SearchBusinessLogic
{
  func doFetchSearchFood(request: Search.FetchSearchMeal.Request)
}

protocol SearchDataStore
{
  //var name: String { get set }
}

class SearchInteractor: SearchBusinessLogic, SearchDataStore
{
  var presenter: SearchPresentationLogic?
  var worker: SearchWorker?
  //var name: String = ""
  
  // MARK: Do something
  
  func doFetchSearchFood(request: Search.FetchSearchMeal.Request)
  {
    worker = SearchWorker()
    worker?.fetchSearchMeal(request: request, handler: { (foods) in
      let response = Search.FetchSearchMeal.Response(foods: foods)
      
      self.presenter?.presentSearchMeal(response: response)
    })
  }
}
