//
//  CountryCodeViewController.swift
//  DoctorPoint
//
//  Created by Mina Mohareb on 25/05/2022.
//

import UIKit
protocol addValueCode
{
    func setValueCode(value: String)
}
class CountryCodeViewController: UIViewController {
    var number: Int = 1
    var data: String = ""
    var value: String?
    var Delegate: addValueCode?
    @IBOutlet weak var titleLBL: UILabel!
    var dataCountry: [CountryCode]!
    @IBOutlet weak var popView: UIView!
    {
        didSet
        {
            popView.backgroundColor = .white
            popView.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
            popView.layer.cornerRadius = 20
        }
    }
    @IBOutlet weak var countryPickerView: UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        dataCountry = ReadJsonFileCountryFromLocal().countriesCode
        countryPickerView.delegate = self
        countryPickerView.dataSource = self
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if number == 1
        {
            self.titleLBL.text = "Select Country Code"
        }else if number == 2
        {
            self.titleLBL!.text = "Select language"
        }
    }
    @IBAction func backMainWithData(_ sender: UIButton) {
        dismiss(animated: true) {
            if self.value != nil
            {
                self.Delegate?.setValueCode(value: self.data)
            }
        }
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
extension CountryCodeViewController: UIPickerViewDataSource, UIPickerViewDelegate
{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dataCountry.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if number == 1
        {
            return "\(dataCountry[row].name)  \(dataCountry[row].dial_code)"
        }else
        {
            return "\(dataCountry[row].name)"
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if number == 1
        {
            value = "\(dataCountry[row].dial_code)"
        }else
        {
            value = "\(dataCountry[row].name)"
        }
        
        guard let val = value else
        {
            return
        }
        data = val
    }
    
}
