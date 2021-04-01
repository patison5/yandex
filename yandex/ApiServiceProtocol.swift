//
//  ApiServiceProtocol.swift
//  yandex
//
//  Created by Fedor Penin on 31.03.2021.
//

protocol ApiServiceProtocol {

	var interactor: ApiServiceDelegate? { get set }

	func getStocks()
}
