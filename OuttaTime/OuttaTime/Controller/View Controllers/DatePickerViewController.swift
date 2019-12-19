//
//  DatePickerViewController.swift
//  OuttaTime
//
//  Created by Kenny on 12/18/19.
//  Copyright © 2019 Hazy Studios. All rights reserved.
//

import UIKit

protocol DatePickerDelegate {
    func destinationDateWasChosen(date: Date)
}

class DatePickerViewController: UIViewController {
    //MARK: IBOutlets
    @IBOutlet weak var pickerView: UIPickerView!
    
    
    //MARK: IBActions
    @IBAction func cancelBtnTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveBtnTapped(_ sender: UIButton) {
        //delegate?.destinationDateWasChosen(date: date)
    }
    
    //MARK: Class Variables
    var delegate: DatePickerDelegate?
    
    
    //MARK: Picker Data
    lazy private var countdownPickerData: [[String]] = {
        let months: [String] = [
            "Jan",
            "Feb",
            "Mar",
            "Apr",
            "May",
            "Jun",
            "Jul",
            "Aug",
            "Sept",
            "Oct",
            "Nov",
            "Dec"
        ]
        let days: [String] = Array(1...31).map {String($0)}
        let years: [String] = Array(1943...2019).map {String($0)}
        let pickerComponents: [[String]] = [months, days, years]
        return pickerComponents
    }()
    
    //MARK: View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.delegate = self
        pickerView.dataSource = self
        // Do any additional setup after loading the view.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension DatePickerViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let components = countdownPickerData[component]
        let dateValue = components[row]
        return dateValue
    }
    
        func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
            100
        }
}

extension DatePickerViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return countdownPickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return countdownPickerData[component].count
    }
    
    
}
