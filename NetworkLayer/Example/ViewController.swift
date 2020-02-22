//
//  ViewController.swift
//  NetworkLayer
//
//  Created by Ramy Nasser on 2/22/20.
//  Copyright © 2020 Ramy Nasser. All rights reserved.
//

import UIKit
class ViewController: UIViewController {
    let network = Netwok<MovieApi>()

    override func viewDidLoad() {
        super.viewDidLoad()

        network.request(service: .getTopMovies(page:1)) { result in
          switch result {
            case let .success(response):
              let movieApiResponse = try? response.map(to: MovieApiResponse.self)
              print(movieApiResponse)
          default:
            print("")

          }
        }
    }


}

