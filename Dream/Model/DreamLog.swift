//
//  DreamLog.swift
//  Dream
//
//  Created by Sunshine on 12/22/22.
//  Copyright © 2022 Stephanie Chiu. All rights reserved.
//

import Foundation

struct DreamLog: Codable {
//    let id: UUID
//    let date: Date
    var transcript: String?

    init(transcript: String? = nil) {
//        self.id = id
//        self.date = date
        self.transcript = transcript
    }
}
