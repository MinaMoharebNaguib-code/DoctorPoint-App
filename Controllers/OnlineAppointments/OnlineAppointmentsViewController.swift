//
//  OnlineAppointmentsViewController.swift
//  DoctorPoint
//
//  Created by Mina Mohareb on 31/05/2022.
//

import UIKit

class OnlineAppointmentsViewController: UIViewController {

    @IBOutlet weak var imageDoctor: UIImageView!
    {
        didSet
        {
            imageDoctor.layer.cornerRadius = 20
        }
    }
    @IBOutlet weak var nameDoctor: UILabel!
    @IBOutlet weak var desDoctor: UILabel!
    @IBOutlet weak var viewMain: UIView!
    {
        didSet
        {
            viewMain.layer.cornerRadius = 40
            viewMain.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
            viewMain.layer.masksToBounds = true
        }
    }
    @IBOutlet weak var viewSec: UIView!
    {
        didSet
        {
            viewSec.layer.cornerRadius = 40
            viewSec.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
            viewSec.layer.masksToBounds = true
        }
    }
    @IBOutlet weak var buttonReview: UIButton!
    {
        didSet
        {
            buttonReview.layer.cornerRadius = 10
        }
    }
    // View Show Edit
    @IBOutlet weak var viewPhone: UIView!
    {
        didSet
        {
            viewPhone.layer.cornerRadius = 20
        }
    }
    @IBOutlet weak var viewMess: UIView!
    {
        didSet
        {
            viewMess.layer.cornerRadius = 20
        }
    }
    @IBOutlet weak var viewVideo: UIView!
    {
        didSet
        {
            viewVideo.layer.cornerRadius = 20
        }
    }
    @IBOutlet weak var viewAlarm: UIView!
    {
        didSet
        {
            viewAlarm.layer.cornerRadius = 20
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.navigationController?.navigationBar.backgroundColor = UIColor(red: 0.969, green: 0.969, blue: 0.969, alpha: 1)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: viewBackNavigationItem())
        title = "Online appointments"
        self.navigationController?.navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor(red: 0.467, green: 0.478, blue: 0.584, alpha: 1),
            .font: UIFont.systemFont(ofSize: 24, weight: .semibold)
        ]
    }
    @IBAction func reviewButton(_ sender: UIButton) {
        let writeReviewVC = self.storyboard?.instantiateViewController(withIdentifier: "WriteReviewsNavigationController") as! WriteReviewsNavigationController
        writeReviewVC.modalPresentationStyle = .fullScreen
        present(writeReviewVC, animated: true, completion: nil)
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
