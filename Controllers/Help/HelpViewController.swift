//
//  HelpViewController.swift
//  DoctorPoint
//
//  Created by Mina Mohareb on 31/05/2022.
//

import UIKit

class HelpViewController: UIViewController {

    @IBOutlet weak var endButtonLayout: NSLayoutConstraint!
    @IBOutlet weak var textView: UITextView!
    {
        didSet
        {
            textView.backgroundColor = .white
            textView.alpha = 0.4
            textView.layer.cornerRadius = 10
            textView.layer.borderWidth = 1
            textView.layer.borderColor = UIColor(red: 0.627, green: 0.635, blue: 0.702, alpha: 1).cgColor
        }
    }
    @IBOutlet weak var mesLabel: UILabel!
    @IBOutlet weak var sendButton: UIButton!
    {
        didSet
        {
            sendButton.layer.cornerRadius = 10
            sendButton.backgroundColor = UIColor(red: 0.627, green: 0.635, blue: 0.702, alpha: 0.25)
            sendButton.setTitleColor(.white, for: .normal)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: viewBackNavigationItem())
        title = "Help"
        self.navigationController?.navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor(red: 0.467, green: 0.478, blue: 0.584, alpha: 1),
            .font: UIFont.systemFont(ofSize: 24, weight: .semibold)
        ]
        keyboardhidding()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.delegate = self
        textView.autocorrectionType = .no
        textView.text = "Type your message"
        textView.textColor = UIColor(red: 0.627, green: 0.635, blue: 0.702, alpha: 1)
        textView.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        textView.textContainerInset = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShowNotification), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHideNotification), name: UIResponder.keyboardWillHideNotification, object: nil)
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
    
    
    @IBAction func buttonSend(_ sender: UIButton) {
        if textView.text != nil && textView.text != "Type your message"
        {
            let doneVC = self.storyboard?.instantiateViewController(withIdentifier: "CompletedViewController") as! CompletedViewController
            doneVC.modalPresentationStyle = .overFullScreen
            doneVC.check = 4
            present(doneVC, animated: true, completion: nil)
        }
    }
    
    @objc func keyboardWillShowNotification(notification: Notification)
    {
        if let frame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue
        {
            let height = frame.cgRectValue.height
            self.endButtonLayout.constant = height - 24
            
        }
    }
    @objc func keyboardWillHideNotification(notification: Notification)
    {
        if let frame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue
        {
            let height = frame.cgRectValue.height
            self.endButtonLayout.constant = height + 24
            
        }

    }
    func keyboardhidding()
    {
        let tap = UITapGestureRecognizer(target: self, action: #selector(keyboardRemove))
        self.view.addGestureRecognizer(tap)
    }
    @objc func keyboardRemove()
    {
        view.endEditing(true)
        self.endButtonLayout.constant = 50
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
extension HelpViewController: UITextViewDelegate
{
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor(red: 0.627, green: 0.635, blue: 0.702, alpha: 1) {
                textView.text = nil
                textView.textColor = UIColor(red: 0.467, green: 0.478, blue: 0.584, alpha: 1)
        }
    }
    func textViewDidChange(_ textView: UITextView) {
        if textView.text != nil && textView.text != "Type your message"
        {
            sendButton.backgroundColor = UIColor(red: 0.071, green: 0.604, blue: 0.498, alpha: 1)
            sendButton.setTitleColor(.white, for: .normal)
            sendButton.isEnabled = true
        }
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
                textView.text = "Type your message"
                textView.textColor = UIColor(red: 0.627, green: 0.635, blue: 0.702, alpha: 1)
            sendButton.backgroundColor = UIColor(red: 0.627, green: 0.635, blue: 0.702, alpha: 0.25)
            sendButton.setTitleColor(.white, for: .normal)
            sendButton.isEnabled = false
        }
        if textView.text == "Type your message"
        {
            sendButton.backgroundColor = UIColor(red: 0.627, green: 0.635, blue: 0.702, alpha: 0.25)
            sendButton.setTitleColor(.white, for: .normal)
            sendButton.isEnabled = false
        }
    }
}
