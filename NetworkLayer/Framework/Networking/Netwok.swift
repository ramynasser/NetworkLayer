//
//  Netwok.swift
//  NetworkLayer
//
//  Created by Ramy Nasser on 2/22/20.
//  Copyright © 2020 Ramy Nasser. All rights reserved.
//

import Foundation

open class Netwok<R: Service>: NetworkingType {
    public init() {}
    @discardableResult
    public func request(
        service: R,
        session: NetworkingSession = URLSession.shared,
        queue: DispatchQueue = .main,
        completion: @escaping (Result<Response, NetworkingError>) -> Void
        ) -> URLSessionDataTask {
        let request = URLRequest(service: service)
        return session.loadData(with: request, queue: queue) { response, error in
            if let error = error {
                completion(.failure(.underlying(error, response)))
                return
            }

            guard
                let httpURLResponse = response.httpURLResponse,
                200..<300 ~= httpURLResponse.statusCode else {
                completion(.failure(.statusCode(response)))
                return
            }

            completion(.success(response))
        }
    }
}
