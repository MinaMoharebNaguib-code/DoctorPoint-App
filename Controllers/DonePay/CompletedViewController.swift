//
//  CompletedViewController.swift
//  DoctorPoint
//
//  Created by Mina Mohareb on 25/05/2022.
//

import UIKit

class CompletedViewController: UIViewController {
    var check: Int = 0
    @IBOutlet weak var popView: UIView!
    {
        didSet
        {
            popView.backgroundColor = .white
            popView.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
            popView.layer.cornerRadius = 20
            popView.layer.masksToBounds = true
        }
    }
    @IBOutlet weak var viewType: UIView!
    {
        didSet
        {
            viewType.backgroundColor = UIColor(red: 0.965, green: 0.965, blue: 0.965, alpha: 1)
            viewType.layer.cornerRadius = 25
            viewType.layer.masksToBounds = true
        }
    }
    @IBOutlet weak var imageType: UIImageView!
    @IBOutlet weak var checkView: UIView!
    {
        didSet
        {
            checkView.layer.cornerRadius = checkView.frame.height / 2
            checkView.layer.masksToBounds = true
        }
    }
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var goButton: UIButton!
    {
        didSet
        {
            goButton.layer.cornerRadius = 10
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        switch check
        {
        case 1:
            imageType.image = UIImage(named: "Me_Icon")
            goButton.isHidden = true
        case 2:
            imageType.image = UIImage(named: "Vo_Icon")
            goButton.isHidden = false
        case 3:
            imageType.image = UIImage(named: "Vi_Icon")
            goButton.isHidden = false
        case 4:
            self.imageType.image = UIImage(named: "Mail_Icon")
            self.titleLabel.text = "Mail sent"
            self.textLabel.text = "Your mail successfully sent. We will get back to you soon. "
            self.goButton.isHidden = false
        default:
            imageType.image = UIImage(named: "Me_Icon")
            goButton.isHidden = true
        }
    }
    @IBAction func goToDashboard(_ sender: UIButton) {
        
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
