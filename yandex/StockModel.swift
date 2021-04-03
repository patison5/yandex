//
//  StockModel.swift
//  yandex
//
//  Created by Fedor Penin on 29.03.2021.
//

struct StockModel {

	var API_id: Int

	/// Логотип компании
	var thumbnailImageName: String?

	/// Название компании
	var title: String?

	/// Полное название компании
	var titleDescription: String?

	/// Текущая цена акции
	var currentPrice: Float?

	/// Предыдущая цена
	var previousPrice: Float?

	/// Валюта
	var currency: String?

	/// Является ли отслеживаемой акцией
	var isFavorite: Bool?
}
