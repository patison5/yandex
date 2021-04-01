//
//  ApiStockModel.swift
//  yandex
//
//  Created by Fedor Penin on 31.03.2021.
//

import Foundation

// MARK: - APIStock

struct ApiStockModel: Codable {

	let stocks: [StockCodable]
}

// MARK: - StockCodable
struct StockCodable: Codable {

	let companyFullName: String
	let beautifullPreviousPrice: String
	let beautifullPrice: String
	let companyName: String
	let currentPrice: Float
	let id: Int
	let imageURL: String
	let previousPrice: Float
	let currency: String
}

// MARK: - APIStock

struct Test: Codable {

	let id: String
}
