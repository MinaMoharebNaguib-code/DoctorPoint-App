//
//  PaymentViewController.swift
//  DoctorPoint
//
//  Created by Mina Mohareb on 07/07/2022.
//

import UIKit

class PaymentViewController: UIViewController {
    let dOB = UIDatePicker()
    @IBOutlet weak var nameTXT: UITextField!
    @IBOutlet weak var cardNumberTXT: UITextField!
    @IBOutlet weak var expireDateTXT: UITextField!
    @IBOutlet weak var cvvTXT: UITextField!
    @IBOutlet weak var paymentButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationController?.navigationBar.backgroundColor = UIColor(red: 0.969, green: 0.969, blue: 0.969, alpha: 1)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: viewBackNavigationItem())
        title = "Payment"
        self.navigationController?.navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor(red: 0.467, green: 0.478, blue: 0.584, alpha: 1),
            .font: UIFont.systemFont(ofSize: 24, weight: .semibold)
        ]
        createDatePicker()
    }
    
    func createDatePicker()
    {
        if #available(iOS 13.4, *) {
            dOB.preferredDatePickerStyle = .wheels
        } else {
            // Fallback on earlier versions
        }
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        // Bar toolbar
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(self.doneDatePicker))
        toolbar.setItems([doneBtn], animated: true)
        expireDateTXT.inputAccessoryView = toolbar
        expireDateTXT.inputView = dOB
        dOB.datePickerMode = .date
    }
    
    @objc func doneDatePicker()
    {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM-yyyy"
        expireDateTXT.text = "\(formatter.string(from: dOB.date))"
        self.view.endEditing(true)
    }
    
    func viewBackNavigationItem() -> UIView
    {
        let headerView = UIView(frame: CGRect(x: 24, y: 0, width: 40, height: 40))
        let buttonBack = UIButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        buttonBack.backgroundColor = UIColor(red: 0.965, green: 0.965, blue: 0.965, alpha: 1)
        buttonBack.layer.cornerRadius = 10
        buttonBack.layer.borderWidth = 1
        buttonBack.layer.borderColor = UIColor(red: 0.627, green: 0.635, blue: 0.702, alpha: 0.2).cgColor
        buttonBack.setImage(UIImage(named: "Back_Icon"), for: .normal)
        buttonBack.addTarget(self, action: #selector(self.back(_:)), for: .touchUpInside)
        headerView.addSubview(buttonBack)
        return headerView
    }
    
    @objc func back(_ sender: UIButton)
    {
        dismiss(animated: true)
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
