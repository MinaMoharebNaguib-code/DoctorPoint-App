//
//  OtpVC.swift
//  DoctorPoint
//
//  Created by Mina Mohareb on 16/06/2022.
//

import UIKit

class OtpVC: UIViewController {

    @IBOutlet weak var msgLabel: UILabel!
    @IBOutlet weak var otpOne: UITextField!
    {
        didSet
        {
            otpOne.layer.masksToBounds = true
            otpOne.layer.cornerRadius = 20
            otpOne.layer.borderWidth = 1
            otpOne.layer.borderColor = UIColor(red: 0.627, green: 0.635, blue: 0.702, alpha: 0.2).cgColor
        }
    }
    @IBOutlet weak var otpTwo: UITextField!
    {
        didSet
        {
            otpTwo.layer.masksToBounds = true
            otpTwo.layer.cornerRadius = 20
            otpTwo.layer.borderWidth = 1
            otpTwo.layer.borderColor = UIColor(red: 0.627, green: 0.635, blue: 0.702, alpha: 0.2).cgColor
        }
    }
    @IBOutlet weak var otpThree: UITextField!
    {
        didSet
        {
            otpThree.layer.masksToBounds = true
            otpThree.layer.cornerRadius = 20
            otpThree.layer.borderWidth = 1
            otpThree.layer.borderColor = UIColor(red: 0.627, green: 0.635, blue: 0.702, alpha: 0.2).cgColor
        }
    }
    @IBOutlet weak var otpFourth: UITextField!
    {
        didSet
        {
            otpFourth.layer.masksToBounds = true
            otpFourth.layer.cornerRadius = 20
            otpFourth.layer.borderWidth = 1
            otpFourth.layer.borderColor = UIColor(red: 0.627, green: 0.635, blue: 0.702, alpha: 0.2).cgColor
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationController?.navigationBar.backgroundColor = UIColor(red: 0.969, green: 0.969, blue: 0.969, alpha: 1)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: viewBackNavigationItem())
        self.otpOne.delegate = self
        self.otpTwo.delegate = self
        self.otpThree.delegate = self
        self.otpFourth.delegate = self
        self.otpOne.addTarget(self, action: #selector(self.changeCharacter(textField:)), for: .editingChanged)
        self.otpTwo.addTarget(self, action: #selector(self.changeCharacter(textField:)), for: .editingChanged)
        self.otpThree.addTarget(self, action: #selector(self.changeCharacter(textField:)), for: .editingChanged)
        self.otpFourth.addTarget(self, action: #selector(self.changeCharacter(textField:)), for: .editingChanged)
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
    @objc func changeCharacter(textField: UITextField)
    {
        if textField.text?.utf8.count == 1
        {
            switch textField
            {
            case otpOne:
                otpTwo.becomeFirstResponder()
            case otpTwo:
                otpThree.becomeFirstResponder()
            case otpThree:
                otpFourth.becomeFirstResponder()
            default:
                break
            }
        }else if textField.text!.isEmpty
        {
            switch textField
            {
            case otpFourth:
                otpThree.becomeFirstResponder()
            case otpThree:
                otpTwo.becomeFirstResponder()
            case otpTwo:
                otpOne.becomeFirstResponder()
            default:
                break
            }
        }
    }
    @IBAction func resetCode(_ sender: UIButton) {
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
extension OtpVC: UITextFieldDelegate
{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField.text!.utf16.count == 1 && !string.isEmpty
        {
            return false
        }else
        {
            return true
        }
    }
}
