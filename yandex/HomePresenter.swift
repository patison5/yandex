//
//  HomePresenter.swift
//  yandex
//
//  Created by Fedor Penin on 29.03.2021.
//

import Foundation

final class HomePresenter: HomePresenterProtocol {

	// MARK: - HomePresenterProtocol properties

	var interactor: HomeInteractorInputProtocol
	var router: HomeRouterProtocol
	weak var controller: HomeViewControllerInputProtocol?

	// MARK: - Init

	/// Иницализатор
	/// - Parameters:
	///   - router: Маршрушизатор
	///   - interactor: Интерактор
	init(router: HomeRouterProtocol, interactor: HomeInteractorInputProtocol) {
		self.router = router
		self.interactor = interactor
	}
}

// MARK: - HomeViewControllerOutputProtocol

extension HomePresenter: HomeViewControllerOutputProtocol {

	func addFavoriteStock(model: StockModel) {
		interactor.addFavoriteStock(model: model)
	}

	func viewDidLoad() {
		interactor.fetch(type: .apiStocks)
	}

	func fetchFavoriteStocks() {
		interactor.fetch(type: .databaseFavoriteStocks)
	}
}

// MARK: - HomeInteractorOutputProtocol

extension HomePresenter: HomeInteractorOutputProtocol {

	func apiStocksFetched(models: [StockModel]) {
		guard Thread.isMainThread else {
			DispatchQueue.main.async { [weak self] in
				self?.apiStocksFetched(models: models)
			}
			return
		}
		controller?.HomeModelFetched(models: models)
	}

	func apiStocksFetchDidFailed(error: String) {
		controller?.HomeModelFetchedFailed(error: error)
	}

	func databaseFavoriteStocksFetched(models: [StockModel]) {
		print(models.count)
	}

	func databaseFavoriteStocksFetchDiDFailed() {
		print("database fetch error")
	}
}
