//
//  FavoriteStocksModel.swift
//  yandex
//
//  Created by Fedor Penin on 29.03.2021.
//

struct FavoriteStocksModel {

	/// Логотип компании
	var thumbnailImageName: String?

	/// Название компании
	var title: String?

	/// Полное название компании
	var titleDescription: String?

	/// Текущая цена акции
	var currentPrice: String?

	/// Дельта изменения цены по сравнении с пердыдущим значением
	var priceDelta: String?

	/// Является ли отслеживаемой акцией
	var isFavorite: Bool?
}
