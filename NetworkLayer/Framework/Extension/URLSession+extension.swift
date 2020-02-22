//
//  Service.swift
//  NetworkLayer
//
//  Created by Ramy Nasser on 2/22/20.
//  Copyright © 2020 Ramy Nasser. All rights reserved.
//

import Foundation
public protocol NetworkingSession {
    typealias CompletionHandler = (Response, Swift.Error?) -> Void
    func loadData(
        with urlRequest: URLRequest,
        queue: DispatchQueue,
        completionHandler: @escaping CompletionHandler
        ) -> URLSessionDataTask
}
extension URLSession: NetworkingSession {
    public func loadData(
        with urlRequest: URLRequest,
        queue: DispatchQueue,
        completionHandler: @escaping (Response, Error?) -> Void
        ) -> URLSessionDataTask {
        let task = dataTask(with: urlRequest) { data, urlResponse, error in
            queue.async {
                let response = Response(
                    urlRequest: urlRequest,
                    data: data,
                    httpURLResponse: urlResponse as? HTTPURLResponse
                )
                completionHandler(response, error)
            }
        }
        task.resume()
        return task
    }
}
