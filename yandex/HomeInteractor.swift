//
//  HomeInteractor.swift
//  yandex
//
//  Created by Fedor Penin on 29.03.2021.
//

import Foundation

final class HomeInteractor: HomeInteractorProtocol {

	/// Презентер модуля
	weak var presenter: HomeInteractorOutputProtocol?

	init() {
		print("interactor init")
	}

	deinit {
		print("interactor deinit")
	}
}

// MARK: - HomeInteractorProtocol

extension HomeInteractor: HomeInteractorInputProtocol {

	func filterApiStocks(str: String) {
		
	}

	func fetch(type: DataType) {
		switch type {
			case .apiStocks: getApiStocks()
			case .databaseFavoriteStocks: print("database stocks")
		}
	}
}

// MARK: - private methods

private extension HomeInteractor {

	func getApiStocks() {

		let url = NSURL(string: "https://finnhub.io/api/v1/stock/symbol?exchange=US&token=c1d0lbf48v6p6471pmm0")
		URLSession.shared.dataTask(with: url! as URL) {
			(data, response, error) in
			if error != nil {
				print(error ?? "error response")
				return
			}

//			let str = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
//			print(str)
		}.resume()

		let models: [HomeStocksModel]? = [
			HomeStocksModel(thumbnailImageName: "AAPL", title: "AAPL", titleDescription: "Apple Inc.", currentPrice: "131.93$", priceDelta: "+$0.12 (1,15%)", isFavorite: false),
			HomeStocksModel(thumbnailImageName: "YNDX", title: "YNDX", titleDescription: "Yandex, LLC", currentPrice: "4 764,6 ₽", priceDelta: "+$0.12 (1,15%)", isFavorite: false),
			HomeStocksModel(thumbnailImageName: "GOOGL", title: "GOOGLE", titleDescription: "Alphabet Class A", currentPrice: "$1 825", priceDelta: "+$0.12 (1,15%)", isFavorite: false)
		]

		if let models = models {
			presenter?.apiStocksFetched(models: models)
		} else {
			presenter?.apiStocksFetchDidFailed()
		}
	}

	func getFavoriteStocks() {
		let models: [HomeStocksModel]? = [
			HomeStocksModel(thumbnailImageName: "AAPL", title: "AAPL", titleDescription: "Apple Inc.", currentPrice: "131.93$", priceDelta: "+$0.12 (1,15%)", isFavorite: false),
			HomeStocksModel(thumbnailImageName: "YNDX", title: "YNDX", titleDescription: "Yandex, LLC", currentPrice: "4 764,6 ₽", priceDelta: "+$0.12 (1,15%)", isFavorite: false),
			HomeStocksModel(thumbnailImageName: "GOOGL", title: "GOOGLE", titleDescription: "Alphabet Class A", currentPrice: "$1 825", priceDelta: "+$0.12 (1,15%)", isFavorite: false)
		]

		if let models = models {
			presenter?.apiStocksFetched(models: models)
		} else {
			presenter?.apiStocksFetchDidFailed()
		}
	}
}
