//
//  SingleViewControllerProtocol.swift
//  yandex
//
//  Created by Fedor Penin on 10.04.2021.
//

import UIKit

protocol SingleViewControllerProtocol where Self: UIViewController {
	
	/// Презентер модуля
	var presenter: SingleViewControllerOutputProtocol { get set }
}
