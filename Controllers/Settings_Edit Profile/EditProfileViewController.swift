//
//  EditProfileViewController.swift
//  DoctorPoint
//
//  Created by Mina Mohareb on 06/07/2022.
//

import UIKit
import PhotosUI

class EditProfileViewController: UIViewController {

    // MARK: - Constants
    var avatarImage: UIImage?
    let gender = ["Male","Female"]
    let genderPickerView = UIPickerView()
    var countryRec = UITapGestureRecognizer()
    let dOB = UIDatePicker()
    
    
    // MARK: - Outlets
    @IBOutlet weak var imageProfile: UIImageView!
    {
        didSet
        {
            imageProfile.layer.cornerRadius = 40
        }
    }
    @IBOutlet weak var changeButton: UIButton!
    {
        didSet
        {
            changeButton.layer.cornerRadius = changeButton.frame.height / 2
        }
    }
    @IBOutlet weak var saveButton: UIButton!
    {
        didSet
        {
            saveButton.layer.cornerRadius = 10
        }
    }
    @IBOutlet weak var NameTXT: UITextField!
    @IBOutlet weak var countryCode: UILabel!
    @IBOutlet weak var phoneTXT: UITextField!
    @IBOutlet weak var passwordTXT: UITextField!
    @IBOutlet weak var genderTXT: UITextField!
    @IBOutlet weak var dofTXT: UITextField!
    @IBOutlet weak var addressTXT: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: viewBackNavigationItem())
        genderPickerView.delegate = self
        genderPickerView.dataSource = self
        genderTXT.inputView = genderPickerView
        genderPickerView.tag = 1
        createDatePicker()
        imagePicker()
        
        title = "Edit profile"
        self.navigationController?.navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor(red: 0.467, green: 0.478, blue: 0.584, alpha: 1),
            .font: UIFont.systemFont(ofSize: 24, weight: .semibold)
        ]
        
        countryCode.isUserInteractionEnabled = true
        countryCode.addGestureRecognizer(countryRec)
        countryRec.addTarget(self, action: #selector(self.country))
    }
    
    
    //MARK: - IBActions
    
    
    
    
    
    
    
    //MARK: - Helper Functions
    @objc func country()
    {
        let countryVC = UIStoryboard(name: "ScreensApp", bundle: nil).instantiateViewController(withIdentifier: "CountryCodeViewController") as! CountryCodeViewController
        countryVC.modalPresentationStyle = .overFullScreen
        countryVC.Delegate = self
        present(countryVC, animated: true, completion: nil)
    }
    
    func imagePicker()
    {
        changeButton.addTarget(self, action: #selector(self.imageTapped), for: .touchUpInside)
    }
    
    @objc func imageTapped(){
        if #available(iOS 14, *) {
            var config = PHPickerConfiguration()
            config.filter = .images
            config.selectionLimit = 1
            let imagePicker = PHPickerViewController(configuration: config)
            imagePicker.delegate = self
            present(imagePicker, animated: true, completion: nil)
        } else {
            let imageOld = UIImagePickerController()
            imageOld.sourceType = .photoLibrary
            imageOld.delegate = self
            imageOld.allowsEditing = true
            present(imageOld, animated: true, completion: nil)
        }
        
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
        dofTXT.inputAccessoryView = toolbar
        dofTXT.inputView = dOB
        dOB.datePickerMode = .date
    }
    
    @objc func doneDatePicker()
    {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM dd yyyy"
        dofTXT.text = "\(formatter.string(from: dOB.date))"
        self.view.endEditing(true)
    }
    

    
    @objc func back(_ sender: UIButton)
    {
        dismiss(animated: true)
    }

    
    // MARK: - Navigation
    
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

}

extension EditProfileViewController : UIPickerViewDelegate, UIPickerViewDataSource
{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 1:
            return gender.count
        default:
            return 1
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 1:
            return gender[row]
        default:
            return ""
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 1:
            genderTXT.text = gender[row]
            genderTXT.resignFirstResponder()
        default:
            print("Error")
        }
    }
}

extension EditProfileViewController : PHPickerViewControllerDelegate
{
    @available(iOS 14, *)
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        self.dismiss(animated: true, completion: nil)
        for result in results {
            result.itemProvider.loadObject(ofClass: UIImage.self, completionHandler: {(image,error) in
                if let image = image as? UIImage {
                    DispatchQueue.main.async {
                        self.avatarImage = image
                        self.imageProfile.image = self.avatarImage!
                    }
                }else
                {
                    
                }
            })
        }
    }
}
extension EditProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate
{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage
        {
            self.avatarImage = image
            self.imageProfile.image = self.avatarImage!
        }
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}

extension EditProfileViewController: addValueCode
{
    func setValueCode(value: String) {
        self.countryCode.text = value
    }
}
