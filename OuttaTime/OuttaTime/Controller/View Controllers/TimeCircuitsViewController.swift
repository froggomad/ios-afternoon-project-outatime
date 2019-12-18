//
//  TimeCircuitsViewController.swift
//  OuttaTime
//
//  Created by Kenny on 12/18/19.
//  Copyright © 2019 Hazy Studios. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {
    //MARK: IBOutlets
    @IBOutlet weak var destinationTimeLbl: UILabel!
    @IBOutlet weak var presentTimeLbl: UILabel!
    @IBOutlet weak var timeDepartedLbl: UILabel!
    @IBOutlet weak var speedLbl: UILabel!
    
    //MARK: IBActions
    @IBAction func travelBackBtn(_ sender: UIButton) {
        
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
    
    //MARK: View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        let date = Date(timeIntervalSinceNow: 0)
        speedLbl.text = "\(speed) MPH"
        timeDepartedLbl.text = "--- --, ----"
        presentTimeLbl.text = dateFormatter.string(from: date)
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "" {
            if let destination = segue.destination as? DatePickerViewController {
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
