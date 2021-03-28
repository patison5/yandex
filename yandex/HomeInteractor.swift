//
//  HomeInteractor.swift
//  yandex
//
//  Created by Fedor Penin on 29.03.2021.
//

import UIKit

final class HomeInteractor: HomeInteractorProtocol {

	weak var presenter: HomeInteractorOutputProtocol?
}

// MARK: - HomeInteractorProtocol

extension HomeInteractor: HomeInteractorInputProtocol { }
