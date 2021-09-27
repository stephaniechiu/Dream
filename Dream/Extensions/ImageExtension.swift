//
//  ImageExtension.swift
//  Dream
//
//  Created by Stephanie Chiu on 9/20/21.
//  Copyright © 2021 Stephanie Chiu. All rights reserved.
//

import UIKit

extension UIImage {

	// Reference: https://stackoverflow.com/questions/28517866/how-to-set-the-alpha-of-an-uiimage-in-swift-programmatically
	func withAlpha(_ alpha: CGFloat) -> UIImage {
		return UIGraphicsImageRenderer(size: size, format: imageRendererFormat).image { _ in
			draw(in: CGRect(origin: .zero, size: size), blendMode: .normal, alpha: alpha)
		}
	}
}
