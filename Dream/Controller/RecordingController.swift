//
//  MicrophoneController.swift
//  Dream
//
//  Created by Stephanie Chiu on 11/25/22.
//  Copyright © 2022 Stephanie Chiu. All rights reserved.
//

import UIKit
import Speech
import SoundWave

class RecordingController: UIViewController {

    var speechRecognizer = SpeechRecognizer()
    private var isRecording = false
    let dreamLog = DreamLog()

    let recordingView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.darkBlueTint
        view.layer.cornerRadius = 26
        view.layer.borderWidth = 0.8
        view.clipsToBounds = true
        return view
    }()

    let audioVisualizationView = AudioVisualizationView()

    let backgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()

    var transcriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        return label
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        transcriptionLabel.text = "🥂"
    }

    override func viewDidAppear(_ animated: Bool) {
        transcribeSpeech()
        isRecording = true
        audioVisualizationView.audioVisualizationMode = .write
        transcriptionLabel.text = "⭐️" 
        transcriptionLabel.text = speechRecognizer.transcript
//        let transcript = DreamLog(transcript: speechRecognizer.transcript)
    }

    override func viewDidDisappear(_ animated: Bool) {
        speechRecognizer.stopTranscribing()
        isRecording = false
        transcriptionLabel.text = "🌞"
    }

    func setupSubviews() {
        view.addSubview(backgroundView)
        backgroundView.addSubview(recordingView)
        recordingView.addSubview(audioVisualizationView)
        recordingView.addSubview(transcriptionLabel)
        audioVisualizationView.translatesAutoresizingMaskIntoConstraints = false
        audioVisualizationView.backgroundColor = .darkBlueTint

        NSLayoutConstraint.activate(
            [
                recordingView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                recordingView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                recordingView.heightAnchor.constraint(equalToConstant: 200),
                recordingView.widthAnchor.constraint(equalToConstant: 300),

                audioVisualizationView.centerXAnchor.constraint(equalTo: recordingView.centerXAnchor),
                audioVisualizationView.heightAnchor.constraint(equalToConstant: 130),
                audioVisualizationView.widthAnchor.constraint(equalToConstant: 280),
                audioVisualizationView.topAnchor.constraint(equalTo: recordingView.topAnchor, constant: 8),

                transcriptionLabel.centerXAnchor.constraint(equalTo: recordingView.centerXAnchor),
                transcriptionLabel.topAnchor.constraint(equalTo: audioVisualizationView.bottomAnchor, constant: 8),
            ]
        )
    }

    func transcribeSpeech() {
        speechRecognizer.reset()
        speechRecognizer.transcribe()
        audioVisualizationView.reset()
        if let log = dreamLog.transcript {
            print(log)
            transcriptionLabel.text = log
        }
//        print(":) \(speechRecognizer.transcript)" )
    }

}
