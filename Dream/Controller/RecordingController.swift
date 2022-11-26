//
//  MicrophoneController.swift
//  Dream
//
//  Created by Stephanie Chiu on 11/25/22.
//  Copyright © 2022 Stephanie Chiu. All rights reserved.
//

import UIKit

class RecordingController: UIViewController {

    var speechRecognizer = SpeechRecognizer()
    private var isRecording = false

    let recordingView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.darkBlueTint
        view.layer.cornerRadius = 26
        view.layer.borderWidth = 0.8
        view.clipsToBounds = true
        return view
    }()

    let backgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    func setupSubviews() {
        view.addSubview(backgroundView)
        backgroundView.addSubview(recordingView)

        NSLayoutConstraint.activate(
            [
                recordingView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                recordingView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                recordingView.heightAnchor.constraint(equalToConstant: 200),
                recordingView.widthAnchor.constraint(equalToConstant: 300),
            ]
        )
    }

    func transcribeSpeech() {
        speechRecognizer.reset()
        speechRecognizer.transcribe()
    }

}
