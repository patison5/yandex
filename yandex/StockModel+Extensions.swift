//
//  StockModel+Extensions.swift
//  yandex
//
//  Created by Fedor Penin on 03.04.2021.
//

import Foundation

extension StockModel {

	var currentPriceFormatted: String {
		return "\(currency ?? "")\(currentPrice ?? 0)"
	}

	var priceDeltaFormatted: String {
		guard let previousPrice = previousPrice,
			  let currency = currency else {
			return ""
		}
		let sign = (priceDelta > 0) ? "" : "-"
		let deltaPercentStr = String(format: "%.2f", abs(priceDelta / previousPrice))
		let priceDeltaStr = String(format: "\(sign)\(currency)%.2f", abs(priceDelta))

		return "\(priceDeltaStr) (\(deltaPercentStr)%)"
	}

	/// Дельта изменения цены по сравнении с пердыдущим значением
	var priceDelta: Float {
		guard let previousPrice = previousPrice,
			  let currentPrice = currentPrice else {
			return 0
		}
		return previousPrice - currentPrice
	}
}
