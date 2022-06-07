//
//  MicrophoneButton.swift
//  Dream
//
//  Created by Stephanie Chiu on 9/17/21.
//  Copyright © 2021 Stephanie Chiu. All rights reserved.
//

import UIKit

class MicrophoneButton: UIButton {

	// MARK: - Constants

	let microphoneButton: UIButton = {
		let button = UIButton()
		button.backgroundColor = UIColor.buttonBackground
		button.layer.borderColor = UIColor.buttonBackground.cgColor
        button.alpha = 0.5
		button.layer.cornerRadius = 26
		button.layer.borderWidth = 0.8
        button.clipsToBounds = true
		button.translatesAutoresizingMaskIntoConstraints = false
		return button
	}()

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
		addSubviews()
		NSLayoutConstraint.activate(
			[
                microphoneButton.widthAnchor.constraint(equalToConstant: 52),
                microphoneButton.heightAnchor.constraint(equalToConstant: 52),
				microphoneImage.centerYAnchor.constraint(equalTo: microphoneButton.centerYAnchor),
				microphoneImage.centerXAnchor.constraint(equalTo: microphoneButton.centerXAnchor),
			]
		)
	}

	func addSubviews() {
		addSubview(microphoneButton)
        microphoneButton.addSubview(microphoneImage)
    }

	func setBlurEffect() {
		let blurView = UIVisualEffectView()
		blurView.frame = microphoneButton.frame
		blurView.effect = UIBlurEffect(style: .regular)
		microphoneButton.addSubview(blurView)
	}
}
