//
//  TimeCircuitsViewController.swift
//  OuttaTime
//
//  Created by Kenny on 12/18/19.
//  Copyright © 2019 Hazy Studios. All rights reserved.
//

import UIKit

protocol TimeTravelDelegate {
    func checkSpeed(speed: Int)
    func timerDidUpdate()
}

class TimeCircuitsViewController: UIViewController {
    //MARK: IBOutlets
    @IBOutlet weak var destinationTimeLbl: UILabel!
    @IBOutlet weak var presentTimeLbl: UILabel!
    @IBOutlet weak var timeDepartedLbl: UILabel!
    @IBOutlet weak var speedLbl: UILabel!
    
    //MARK: IBActions
    @IBAction func travelBackBtn(_ sender: UIButton) {
        timeMachine?.startTimer()
    }
    
    //MARK: Class Variables
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US")
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        //same as MMM dd, yyyy
        return formatter
    }
    
    var speed: Int = 0
    
    var timeMachine: TimeTravelController?
    
    //MARK: View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        //setup initial view
        #warning("Use setupViewsMethod")
        navigationController?.navigationBar.isHidden = true
        let date = Date(timeIntervalSinceNow: 0)
        speedLbl.text = "\(speed) MPH"
        timeDepartedLbl.text = "--- --, ----"
        presentTimeLbl.text = dateFormatter.string(from: date)        
        //create TimeTravelController
        self.timeMachine = TimeTravelController()
        //MARK: Testing
        timeMachine?.delegate = self
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DatePickerVCSegue" {
            if let destination = segue.destination as? DatePickerViewController {
                print("assigning picker delegate")
                destination.delegate = self
            }
        }
    }
    
}

extension TimeCircuitsViewController: DatePickerDelegate {
    func destinationDateWasChosen(date: Date) {
        self.destinationTimeLbl.text = dateFormatter.string(from: date)
    }
}

extension TimeCircuitsViewController: TimeTravelDelegate {
    func checkSpeed(speed: Int) {
        if speed >= 88 {
            speedLbl.text = "\(speed) MPH"
            print("speed reached, portal opened")
            timeMachine?.resetTimer()
            timeDepartedLbl.text = presentTimeLbl.text
            presentTimeLbl.text = destinationTimeLbl.text
            self.speed = 0
            guard let presentTimeText = presentTimeLbl.text else {return}
            AlertController.showBasicAlert(title: "Time Travel Successful", message: "Your new date is \(presentTimeText)", vc: self)
        } else {
            self.speed += 1
            speedLbl.text = "\(speed) MPH"
            print("We're speeding up to 88 so we can make a portal!")
        }
    }
    
    func timerDidUpdate() {
        checkSpeed(speed: speed)
    }
    
    
}
