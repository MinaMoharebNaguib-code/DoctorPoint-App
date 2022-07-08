//
//  CustomCountryPickerView.swift
//  DoctorPoint
//
//  Created by Mina Mohareb on 25/05/2022.
//

import UIKit

class CustomCountryPickerView: UIPickerView {
    var modelData: [CountryCode]!
    let customWidth: CGFloat = 200
    let customHeight: CGFloat = 20
    
}
extension CustomCountryPickerView: UIPickerViewDataSource
{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return modelData.count
    }
}
extension CustomCountryPickerView: UIPickerViewDelegate
{
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return customWidth
    }
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return customHeight
    }
    override func view(forRow row: Int, forComponent component: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: customWidth, height: customHeight))
        let countryDataLabel = UILabel(frame: CGRect(x: 0, y: 0, width: customWidth, height: customHeight))
        countryDataLabel.textColor = UIColor(red: 0.467, green: 0.478, blue: 0.584, alpha: 1)
        countryDataLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        countryDataLabel.textAlignment = .center
        countryDataLabel.text = "\(modelData[row].name)   \(modelData[row].dial_code)"
        view.addSubview(countryDataLabel)
        return view
    }
}
