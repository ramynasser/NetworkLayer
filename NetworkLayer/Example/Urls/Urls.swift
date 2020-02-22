//
//  Urls.swift
//  NetworkLayer
//
//  Created by Ramy Nasser on 2/22/20.
//  Copyright © 2020 Ramy Nasser. All rights reserved.
//

import Foundation
import Foundation
enum Urls {
    
    static var environment: UrlEnvironment {
        #if DEVELOPMENT
            return .development
        #elseif PRODUCTION
            return .production
        #else
            return .staging
        #endif
    }

    enum UrlEnvironment: String {
        case development
        case production
        case staging

        var baseUrl: String {
            let developmentUrl = "https://api.themoviedb.org/3/discover/"
            let productionUrl = "https://api.themoviedb.org/3/discover/"
            let stagingUrl = "https://api.themoviedb.org/3/discover/"

            switch self {
            case .development:
                return developmentUrl
            case .production:
                return productionUrl
            case .staging:
                return stagingUrl
            }
        }

        var mediaUrl: String {
            let developmentUrl = "https://image.tmdb.org/t/p/w185"
            let productionUrl = "https://image.tmdb.org/t/p/w185"
            let stagingUrl = "https://image.tmdb.org/t/p/w185"

            switch self {
            case .development:
                return developmentUrl
            case .production:
                return productionUrl
            case .staging:
                return stagingUrl
            }
        }
    }
}
