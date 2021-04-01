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

	init() { }
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
		apiService.getStocks()
	}

	func getFavoriteStocks() {
		apiService.getStocks()
	}
}

extension HomeInteractor: ApiServiceDelegate {
	func stocksDidFetched(model: ApiStockModel?, error: ApiError?) {
		if let error = error {
			presenter?.apiStocksFetchDidFailed(error: error.rawValue)
			return
		}

		guard let apiModel = model else { return }

		let models: [HomeStocksModel] = apiModel.stocks.compactMap {
			let currentPrice = $0.currentPrice
			let priceDelta = $0.previousPrice - $0.currentPrice
			let sign = (priceDelta > 0) ? "" : "-"
			let priceDeltaStr = String(format: "\(sign)\($0.currency)%.2f", abs(priceDelta))
			let deltaPercentStr = String(format: "%.2f", abs(priceDelta / $0.previousPrice))

			return HomeStocksModel(thumbnailImageName: $0.imageURL, title: $0.companyName, titleDescription: $0.companyFullName, currentPrice: "\($0.currency)\(currentPrice)", priceDelta: "\(priceDeltaStr) (\(deltaPercentStr)%)", isFavorite: false)
		}

		presenter?.apiStocksFetched(models: models)
	}
}
