//
//  NetworkingError.swift
//  NetworkLayer
//
//  Created by Ramy Nasser on 2/22/20.
//  Copyright © 2020 Ramy Nasser. All rights reserved.
//

import Foundation
public enum NetworkingError: Error {
    case noData(Response)
    case statusCode(Response)
    case decoding(Error, Response)
    case underlying(Error, Response?)
}
public extension NetworkingError {
    var response: Response? {
        switch self {
        case let .noData(response):
            return response
        case let .statusCode(response):
            return response
        case let .decoding(_, response):
            return response
        case let .underlying(_, response):
            return response
        }
    }
}
extension NetworkingError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .noData:
            return "The request gave no data."
        case .statusCode:
            return "Status code didn't fall within the given range."
        case .decoding:
            return "Failed to map data to a Decodable object."
        case let .underlying(error, _):
            return error.localizedDescription
        }
    }
}
