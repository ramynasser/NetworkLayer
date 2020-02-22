//
//  Endpoint.swift
//  NetworkLayer
//
//  Created by Ramy Nasser on 2/22/20.
//  Copyright © 2020 Ramy Nasser. All rights reserved.
//

import Foundation

public enum Endpoint {
    case get(path: String)
    case post(path: String)
    case put(path: String)
    case delete(path: String)
    enum HTTPMethod: String {
           case get = "GET"
           case post = "POST"
           case put = "PUT"
           case delete = "DELETE"
    }
    
}
extension Endpoint {
       var path: String {
           switch self {
           case  .get(let path):
              return path
           case .post(let path):
             return path
           case .put(let path):
             return path
           case .delete(let path):
             return path
        }
    }
}
extension Endpoint {
      var method: HTTPMethod {
         switch self {
         case .get:
             return .get
         case .post:
             return .post
         case .put:
             return .put
         case .delete:
             return .delete
         }
     }
}
