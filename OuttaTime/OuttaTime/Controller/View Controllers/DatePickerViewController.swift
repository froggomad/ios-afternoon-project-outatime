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
    
    //MARK: View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.delegate = self
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
    
}

extension DatePickerViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        #warning("Set This")
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        #warning("Set This")
        return 0
    }
    
    
}
