//
//  HomeViewControllerOutputProtocol.swift
//  yandex
//
//  Created by Fedor Penin on 29.03.2021.
//

protocol HomeViewControllerOutputProtocol: AnyObject {

	func viewDidLoad()

	/// Добавить акцию в избранное
	/// - Parameter model: данные добавляемой акции
	func addFavoriteStock(model: StockModel)

	/// Получить список избранных акций
	func fetchFavoriteStocks()
}
