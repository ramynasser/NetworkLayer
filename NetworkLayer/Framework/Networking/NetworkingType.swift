//
//  NetworkingType.swift
//  NetworkLayer
//
//  Created by Ramy Nasser on 2/22/20.
//  Copyright © 2020 Ramy Nasser. All rights reserved.
//

import Foundation
public protocol NetworkingType {

    associatedtype Service

    func request(
        service: Service,
        session: NetworkingSession,
        queue: DispatchQueue,
        completion: @escaping (Result<Response, NetworkingError>) -> Void
        ) -> URLSessionDataTask
}
