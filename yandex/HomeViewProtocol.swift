//
//  HomeViewProtocol.swift
//  yandex
//
//  Created by Fedor Penin on 29.03.2021.
//

import UIKit

protocol HomeViewProtocol: AnyObject {
	
	/// Источник данных вью
	var dataSource: HomeViewDataSource? { get set }
	
	/// обработчик нажатий вье
	var delegate: HomeViewDelegate? { get set }
}
