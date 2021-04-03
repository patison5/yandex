//
//  HomeViewControllerInputProtocol.swift
//  yandex
//
//  Created by Fedor Penin on 29.03.2021.
//

protocol HomeViewControllerInputProtocol: AnyObject {

	/// Получить список моделей акций
	/// - Parameter models: список моделей
	func HomeModelFetched(models: [StockModel])

	/// Ошибка получения списка акций
	/// - Parameter error: ошибка
	func HomeModelFetchedFailed(error: String)

	/// Поменять заголовок в соответствии с номером
	/// - Parameter index: номер
	func setTitleForIndex(index: Int)

	/// Клик по панели меню
	/// - Parameter index: номер кнопки панели
	func menuItemDidClicked(index: Int)
}
