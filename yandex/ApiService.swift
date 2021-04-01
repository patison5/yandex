//
//  ApiService.swift
//  yandex
//
//  Created by Fedor Penin on 29.03.2021.
//

import Foundation

class ApiService: ApiServiceProtocol {

	weak var interactor: ApiServiceDelegate?

	func getStocks() {

		let endpoint = ApiEndpoint(path: .stocks, params: [:], customParams: [:])
		guard let urlString = endpoint.full, let url = URL(string: urlString) else {
			interactor?.stocksDidFetched(model: nil, error: .incorrectEndpoint)
			return
		}

		var request = URLRequest(url: url)
		request.httpMethod = "GET"
		request.timeoutInterval = 10.0

		let task = URLSession.shared.dataTask(with: request) { [weak self] (data, response, error) in
			guard error == nil, let data = data else {
				self?.interactor?.stocksDidFetched(model: nil, error: .connectionTimedOut)
				return
			}

			do {
				let models = try JSONDecoder().decode(ApiStockModel.self, from: data)
				self?.interactor?.stocksDidFetched(model: models, error: nil)
			} catch {
				self?.interactor?.stocksDidFetched(model: nil, error: .ErrorParsingJson)
				return
			}
		}
		task.resume()
	}
}
