//
//  MovieService.swift
//  NetworkLayer
//
//  Created by Ramy Nasser on 2/22/20.
//  Copyright © 2020 Ramy Nasser. All rights reserved.
//

import Foundation
enum MovieApi {
    case getTopMovies(page:Int)
}
extension MovieApi:Service {
    var baseURL: URL {
        guard let url = URL(string:"https://api.themoviedb.org/3/discover/") else {
            fatalError("baseURL could not be configured.")
        }
        return url
    }
    
    var endpoint: Endpoint {
        switch self {
        case .getTopMovies:
            return .get(path: "movie")
      
        }
    }
    
    var task: Task {
        switch self {
        case .getTopMovies(let page):
            let key = "acea91d2bff1c53e6604e4985b6989e2"
            let params: [String: Any] = ["page":page,"api_key":key]
            return .requestWithParameters(params, encoding: URLEncoding())
        }
    }
    
    var headers: [String : String] {
        return ["Content-Type": "Application/json"]
    }
    
    var cachePolicy: URLRequest.CachePolicy {
         return .useProtocolCachePolicy
    }
    
    
}
