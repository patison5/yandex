//
//  FavoriteStockEntity.swift
//  yandex
//
//  Created by Fedor Penin on 02.04.2021.
//

import Foundation
import RealmSwift

class FavoriteStockEntity: Object {

	/// Уникальный идентификатор
	@objc dynamic var uuid: String = UUID().uuidString

	/// Id
	@objc dynamic var API_id: Int = 0

	/// Название компании
	@objc dynamic var title: String?

	/// Полное название компании
	@objc dynamic var titleDescription: String?
	
	/// Фотография
	@objc dynamic var thumbnailImageName: String?

	/// Валюта
	@objc dynamic var currency: String?

	/// Текущая цена акции
	var currentPrice = RealmOptional<Float>()

	/// Дельта изменения цены по сравнении с пердыдущим значением
	var previousPrice = RealmOptional<Float>()
}

extension FavoriteStockEntity {

	enum Currency: String {
		case rub
		case usd
	}
}

extension FavoriteStockEntity {

	static func object(with model: StockModel) -> FavoriteStockEntity {
		let object = FavoriteStockEntity()
		object.API_id = model.API_id
		object.previousPrice = RealmOptional<Float>(model.previousPrice)
		object.currentPrice = RealmOptional<Float>(model.currentPrice)
		object.titleDescription = model.titleDescription
		object.thumbnailImageName = model.thumbnailImageName
		object.title = model.title
		object.currency = model.currency
		return object
	}
}
