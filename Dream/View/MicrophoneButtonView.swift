//
//  MicrophoneButtonView.swift
//  Dream
//
//  Created by Stephanie Chiu on 9/17/21.
//  Copyright © 2021 Stephanie Chiu. All rights reserved.
//

import UIKit
import AVFoundation

class MicrophoneButtonView: UIButton {

	// MARK: - Constants

	let microphoneImage: UIImageView = {
		let image = UIImageView(image: UIImage(named: "microphone"))
		image.alpha = 1.0
		image.translatesAutoresizingMaskIntoConstraints = false
		return image
	}()

	// MARK: - Init

	override init(frame: CGRect) {
		super.init(frame: frame)
		setupSubviews()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	func setupSubviews() {
        self.backgroundColor = UIColor.buttonBackground
        self.layer.borderColor = UIColor.buttonBackground.cgColor
        self.alpha = 0.5
        self.layer.cornerRadius = 26
        self.layer.borderWidth = 0.8
        self.clipsToBounds = true
        self.translatesAutoresizingMaskIntoConstraints = false

        addSubview(microphoneImage)

		NSLayoutConstraint.activate(
			[
                self.widthAnchor.constraint(equalToConstant: 52),
                self.heightAnchor.constraint(equalToConstant: 52),
				microphoneImage.centerYAnchor.constraint(equalTo: self.centerYAnchor),
				microphoneImage.centerXAnchor.constraint(equalTo: self.centerXAnchor),
			]
		)
	}
}
