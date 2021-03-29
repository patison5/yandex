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

	/// Отфильтровать акции
	/// - Parameter str: подстрока поиска
	func filterApiStocks(str: String)
}
