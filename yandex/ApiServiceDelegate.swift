//
//  ApiServiceDelegate.swift
//  yandex
//
//  Created by Fedor Penin on 31.03.2021.
//

protocol ApiServiceDelegate: AnyObject {

	func stocksDidFetched(model: ApiStockModel?, error: ApiError?)
}

enum ApiError: String {

	case incorrectEndpoint = "Неправильно указан путь до API сервиса"

	case connectionTimedOut = "Время ожидания вышло"

	case ErrorParsingJson = "Ошибка декодировки JSON"
}
