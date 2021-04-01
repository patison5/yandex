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

	lazy var apiService: ApiServiceProtocol = {
		let service = ApiService()
		service.interactor = self
		return service
	}()

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
		let models: [HomeStocksModel]? = []

		apiService.getStocks()

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

extension HomeInteractor: ApiServiceDelegate {
	func stocksDidFetched(model: ApiStockModel?, error: ApiError?) {
		if let error = error {
			print(error)
			return
		}

		guard let apiModel = model else { return }

		let models: [HomeStocksModel] = apiModel.stocks.compactMap {
			let currentPrice = $0.currentPrice
			let priceDelta = $0.previousPrice - $0.currentPrice
			let sign = (priceDelta > 0) ? "" : "-"
			let priceDeltaStr = String(format: "\(sign)\($0.currency)%.2f", abs(priceDelta))
			let deltaPercentStr = String(format: "%.2f", abs(priceDelta / $0.previousPrice))
			
//			let url = NSURL(string: $0.imageURL)
//			URLSession.shared.dataTask(with: url! as URL, completionHandler: { (data, response, error) in
//				if error != nil {
//					print(error)
//					return
//				}
//
//				print(data)
//			}).resume()

			return HomeStocksModel(thumbnailImageName: $0.imageURL, title: $0.companyName, titleDescription: $0.companyFullName, currentPrice: "\($0.currency)\(currentPrice)", priceDelta: "\(priceDeltaStr) (\(deltaPercentStr)%)", isFavorite: false)
		}

		presenter?.apiStocksFetched(models: models)
	}
}
