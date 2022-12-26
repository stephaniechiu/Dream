//
//  AudioViewModel.swift
//  Dream
//
//  Created by Stephanie on 12/22/22.
//  Copyright © 2022 Stephanie Chiu. All rights reserved.
//

import Foundation

class AudioViewModel {
    var audioMeteringLevelUpdate: ((Float) -> ())?
    var audioDidFinish: (() -> ())?
}
