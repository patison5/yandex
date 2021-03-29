//
//  HomePresenter.swift
//  yandex
//
//  Created by Fedor Penin on 29.03.2021.
//

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

		print("presenter init")
	}

	deinit {
		print("presenter deinit")
	}
}

// MARK: - HomeViewControllerOutputProtocol

extension HomePresenter: HomeViewControllerOutputProtocol {

	func viewDidLoad() {
		interactor.fetch(type: .apiStocks)
	}
}

// MARK: - HomeInteractorOutputProtocol

extension HomePresenter: HomeInteractorOutputProtocol {

	func apiStocksFetched(models: [HomeStocksModel]) {
		controller?.getHomeModel(models: models)
	}

	func apiStocksFetchDidFailed() {
		print("api fetch error")
	}

	func databaseFavoriteStocksFetched(models: [HomeStocksModel]) {
		print(models.count)
	}

	func databaseFavoriteStocksFetchDiDFailed() {
		print("database fetch error")
	}
}
