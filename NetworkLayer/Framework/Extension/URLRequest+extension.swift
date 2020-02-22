//
//  URLRequest+extension.swift
//  NetworkLayer
//
//  Created by Ramy Nasser on 2/22/20.
//  Copyright © 2020 Ramy Nasser. All rights reserved.
//

import Foundation
 extension URLRequest {
    init(service: Service) {
        var url = service.baseURL.appendingPathComponent(service.endpoint.path)

        if case let .requestWithParameters(parameters, encoding) = service.task {
            url = url.appendingQueryParameters(parameters, encoding: encoding)
        }

        self.init(url: url)

        httpMethod = service.endpoint.method.rawValue

        for (key, value) in service.headers {
            addValue(value, forHTTPHeaderField: key)
        }

        if service.endpoint.method == .post || service.endpoint.method == .put,
            case let .requestWithEncodable(encodable) = service.task {
            httpBody = encode(object: AnyEncodable(encodable))
        }
        
        cachePolicy = service.cachePolicy
    }

    func encode<E>(object: E) -> Data? where E: Encodable {
        return try? JSONEncoder().encode(object)
    }
}
