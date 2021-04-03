//
//  HomeInteractor.swift
//  yandex
//
//  Created by Fedor Penin on 29.03.2021.
//

import Foundation
import Realm
import RealmSwift

final class HomeInteractor: HomeInteractorProtocol {

	/// Презентер модуля
	weak var presenter: HomeInteractorOutputProtocol?

	lazy var apiService: ApiServiceProtocol = {
		let service = ApiService()
		service.interactor = self
		return service
	}()

	private var realm: Realm?

	init() {
		guard let link = Realm.Configuration.defaultConfiguration.fileURL else { return }
		realm = try? Realm(fileURL: link)
	}
}

// MARK: - HomeInteractorProtocol

extension HomeInteractor: HomeInteractorInputProtocol {

	func addFavoriteStock(model: StockModel) {
		guard let realm = realm else { return }

		let entity = FavoriteStockEntity.object(with: model)
		try? realm.write {
			if let existedEntity = realm.objects(FavoriteStockEntity.self).first(where: { $0.API_id == entity.API_id }) {
				existedEntity.currentPrice = entity.currentPrice
				existedEntity.previousPrice = entity.previousPrice
				existedEntity.currency = entity.currency
				existedEntity.title = entity.title
				existedEntity.titleDescription = entity.titleDescription
			} else {
				realm.add(entity)
			}
		}
	}

	func fetch(type: DataType) {
		switch type {
			case .apiStocks: getApiStocks()
			case .databaseFavoriteStocks: getFavoriteStocks()
		}
	}
}

// MARK: - private methods

private extension HomeInteractor {

	func getApiStocks() {
		apiService.getStocks()
	}

	func getFavoriteStocks() {

		guard let realm = realm else { return }
		let tasks = realm.objects(FavoriteStockEntity.self)

		let models: [StockModel] = tasks.compactMap {
			return StockModel(API_id: $0.API_id, thumbnailImageName: $0.thumbnailImageName, title: $0.title, titleDescription: $0.titleDescription, currentPrice: $0.currentPrice.value, previousPrice: $0.previousPrice.value, currency: $0.currency, isFavorite: true)
		}
		
		print(models)
		presenter?.apiStocksFetched(models: models)
	}
}

extension HomeInteractor: ApiServiceDelegate {
	func stocksDidFetched(model: ApiStockModel?, error: ApiError?) {
		if let error = error {
			presenter?.apiStocksFetchDidFailed(error: error.rawValue)
			return
		}

		guard let apiModel = model else { return }

		let models: [StockModel] = apiModel.stocks.compactMap {
			return StockModel(API_id: $0.id, thumbnailImageName: $0.imageURL, title: $0.companyName, titleDescription: $0.companyFullName, currentPrice: $0.currentPrice, previousPrice: $0.previousPrice, currency: $0.currency, isFavorite: false)
		}

		presenter?.apiStocksFetched(models: models)
	}
}
