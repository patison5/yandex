//
//  HomeInteractorInputProtocol.swift
//  yandex
//
//  Created by Fedor Penin on 29.03.2021.
//

enum DataType {
	case apiStocks
	case databaseFavoriteStocks
}

protocol HomeInteractorInputProtocol: AnyObject {

	/// Получить акции
	/// - Parameter type: тип запроса
	func fetch(type: DataType)

	/// Добавить акцию в избранное
	/// - Parameter model: модель акции
	func addFavoriteStock(model: StockModel)
}
