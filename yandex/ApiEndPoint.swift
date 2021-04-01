//
//  ApiEndPoint.swift
//  yandex
//
//  Created by Fedor Penin on 31.03.2021.
//

import Foundation

struct ApiEndpoint {

	/// Протокол
	let proto: String = "http"

	/// Адрес
	let host: String = "127.0.0.1"

	/// Путь до конечной точки API
	let path: Path

	/// Порт
	let port: Int = 5000

	/// Сервисные аргументы
	let params: [QueryParam: QueryValue]

	/// Пользовательские аргументы
	var customParams: [QueryParam: String] = [:]

	/// Полный URL
	var full: String? {
		get {
			var components = URLComponents()
			components.scheme = proto
			components.host = host
			components.port = port
			components.path = path.rawValue
			let mainItems = params.compactMap { URLQueryItem(name: $0.key.rawValue, value: $0.value.rawValue) }
			let additionalItems = customParams.compactMap { URLQueryItem(name: $0.key.rawValue, value: $0.value) }
			components.queryItems = mainItems + additionalItems
			return components.string
		}
	}
}

extension ApiEndpoint {

	enum Path: String {
		case stocks = "/api/v1/stocks"
		case news = "/api/v1/company/news"
		case test = "/test"
	}

	enum QueryParam: String {
		case token = "token"
		case id = "id"
		case companyName = "company_name"
	}

	enum QueryValue: String {
		case token = "c1gquen48v6uhn2n6jlg"
	}
}
