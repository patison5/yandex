//
//  HomeInteractorOutputProtocol.swift
//  yandex
//
//  Created by Fedor Penin on 29.03.2021.
//

protocol HomeInteractorOutputProtocol: AnyObject {

	/// Получить список акций
	/// - Parameter models: Список акций
	func apiStocksFetched(models: [StockModel])

	/// Обработать ошибку  выполнения API запроса для получения списка акций
	func apiStocksFetchDidFailed(error: String)

	/// Получить список избранных акций из базы данных
	/// - Parameter models: Список акций
	func databaseFavoriteStocksFetched(models: [StockModel])

	/// Обработать ошибку получения избранных акций
	func databaseFavoriteStocksFetchDiDFailed()
}
