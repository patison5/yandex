//
//  HomeInteractorProtocol.swift
//  yandex
//
//  Created by Fedor Penin on 29.03.2021.
//

protocol HomeInteractorProtocol: AnyObject {

	/// Презентер модуля
	var presenter: HomeInteractorOutputProtocol? { get set }
}
