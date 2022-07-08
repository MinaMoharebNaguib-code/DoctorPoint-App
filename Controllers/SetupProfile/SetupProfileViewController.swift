//
//  SetupProfileViewController.swift
//  DoctorPoint
//
//  Created by Mina Mohareb on 16/06/2022.
//

import UIKit
import PhotosUI
class SetupProfileViewController: UIViewController {
    var avatarImage: UIImage?
    let gender = ["Male","Female"]
    let genderPickerView = UIPickerView()
    let dOB = UIDatePicker()
    @IBOutlet weak var viewProfile: UIView!
    {
        didSet
        {
            viewProfile.backgroundColor = UIColor(red: 0.627, green: 0.635, blue: 0.702, alpha: 0.1)
            viewProfile.layer.cornerRadius = 40
        }
    }
    @IBOutlet weak var imageProfile: UIImageView!
    @IBOutlet weak var setImageButton: UIButton!
    {
        didSet
        {
            setImageButton.backgroundColor = UIColor(red: 0.071, green: 0.604, blue: 0.498, alpha: 1)
            setImageButton.layer.cornerRadius = 20
            setImageButton.layer.borderWidth = 3
            setImageButton.layer.borderColor = UIColor(red: 0.965, green: 0.965, blue: 0.965, alpha: 1).cgColor
        }
    }
    @IBOutlet weak var genderTXT: UITextField!
    @IBOutlet weak var dateOfBirthTXT: UITextField!
    @IBOutlet weak var addressTXT: UITextField!
    @IBOutlet weak var completeButton: UIButton!
    {
        didSet
        {
            completeButton.layer.cornerRadius = 10
        }
    }
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
    }
    @IBAction func buttonComplete(_ sender: UIButton) {
    }
    
    func imagePicker()
    {
        setImageButton.addTarget(self, action: #selector(self.imageTapped), for: .touchUpInside)
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
        dateOfBirthTXT.inputAccessoryView = toolbar
        dateOfBirthTXT.inputView = dOB
        dOB.datePickerMode = .date
    }
    
    @objc func doneDatePicker()
    {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM dd yyyy"
        dateOfBirthTXT.text = "\(formatter.string(from: dOB.date))"
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
        //self.navigationController?.popViewController(animated: true)
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
extension SetupProfileViewController : UIPickerViewDelegate, UIPickerViewDataSource
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
extension SetupProfileViewController : PHPickerViewControllerDelegate
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
extension SetupProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate
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
