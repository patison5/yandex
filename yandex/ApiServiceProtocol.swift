//
//  ApiServiceProtocol.swift
//  yandex
//
//  Created by Fedor Penin on 31.03.2021.
//

/// Описание модуля работы с  Api сервисом
protocol ApiServiceProtocol {

	/// модуль интерактора
	var interactor: ApiServiceDelegate? { get set }

	/// Получить акции
	func getStocks()
}
