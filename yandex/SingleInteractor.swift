//
//  SingleInteractor.swift
//  yandex
//
//  Created by Fedor Penin on 10.04.2021.
//

import Foundation

final class SingleInteractor: SingleInteractorProtocol {

	weak var presenter: SingleInteractorOutputProtocol?
}

extension SingleInteractor: SingleInteractorInputProtocol {

}
