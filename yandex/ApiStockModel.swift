//
//  ApiStockModel.swift
//  yandex
//
//  Created by Fedor Penin on 31.03.2021.
//

import Foundation

// MARK: - APIStockModel

struct ApiStockModel: Codable {

	let stocks: [ApiStock]
}

// MARK: - ApiStock

struct ApiStock: Codable {

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
