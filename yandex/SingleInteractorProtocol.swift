//
//  SingleInteractorProtocol.swift
//  yandex
//
//  Created by Fedor Penin on 10.04.2021.
//

import Foundation

protocol SingleInteractorProtocol: AnyObject {
	
	/// Презентер модуля
	var presenter: SingleInteractorOutputProtocol? { get set }
}
