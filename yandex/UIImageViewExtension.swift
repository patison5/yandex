//
//  UIImageViewExtension.swift
//  yandex
//
//  Created by Fedor Penin on 01.04.2021.
//

import UIKit

var imageCache = NSCache<AnyObject, AnyObject>()

class CustomUIImageView: UIImageView {

	var imageUrl: URL?

	func loadFromUrl(url: URL) {
		imageUrl = url

		image = nil

//		print(imageUrl?.absoluteString)
//		if let imageUrlString = imageUrl?.absoluteString {
//			if let imageFromCache = imageCache.object(forKey: imageUrlString) as! UIImage {
//
//			}
//		}

		DispatchQueue.global().async { [weak self] in
			if let data = try? Data(contentsOf: url) {
				if let image = UIImage(data: data) {
					DispatchQueue.main.async {
						self?.image = image
					}
				}
			}
		}
	}
}
