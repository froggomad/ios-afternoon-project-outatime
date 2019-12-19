//
//  TimeTravelController.swift
//  OuttaTime
//
//  Created by Kenny on 12/18/19.
//  Copyright © 2019 Hazy Studios. All rights reserved.
//

import Foundation

class TimeTravelController {
    private var timer: Timer?
    
    var delegate: TimeTravelDelegate?
    
    private func createTimer() {
        timer = Timer(timeInterval: 0.1, repeats: true, block: { _ in
            self.delegate?.timerDidUpdate()
        })
    }
    
    func startTimer() {
        print("creating and starting timer")
        createTimer()
        timer?.fire()
    }
    
    func resetTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    
    
}
