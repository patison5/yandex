//
//  FavoriteStockEntity.swift
//  yandex
//
//  Created by Fedor Penin on 02.04.2021.
//

import Foundation
import RealmSwift

class FavoriteStockEntity: Object {

	@objc dynamic var name: String = ""
	@objc dynamic var owner: String?
	@objc dynamic var status: String = ""

	convenience init(name: String) {
		self.init()
		self.name = name
	}
}
