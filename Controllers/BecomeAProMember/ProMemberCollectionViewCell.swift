//
//  ProMemberCollectionViewCell.swift
//  DoctorPoint
//
//  Created by Mina Mohareb on 26/05/2022.
//

import UIKit

class ProMemberCollectionViewCell: UICollectionViewCell {
    var VC = UIViewController()
    @IBOutlet weak var viewMain: UIView!
    {
        didSet
        {
            viewMain.layer.masksToBounds = true
            viewMain.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
            viewMain.layer.cornerRadius = 20
            viewMain.layer.borderWidth = 1
            viewMain.layer.borderColor = UIColor(red: 0.627, green: 0.635, blue: 0.702, alpha: 0.2).cgColor
        }
    }
    @IBOutlet weak var titlePlan: UILabel!
    @IBOutlet weak var checkFImage: UIImageView!
    @IBOutlet weak var checkFImage2: UIImageView!
    @IBOutlet weak var checkFImage3: UIImageView!
    @IBOutlet weak var checkFImage4: UIImageView!
    @IBOutlet weak var checkFImage5: UIImageView!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var label5: UILabel!
    @IBOutlet weak var pricePlan: UILabel!
    @IBOutlet weak var conPrice: UILabel!
    @IBOutlet weak var goStart: UIButton!
    {
        didSet
        {
            goStart.layer.cornerRadius = 10
            goStart.addTarget(self, action: #selector(self.pay), for: .touchUpInside)
        }
    }
    override var isSelected: Bool
    {
        didSet
        {
            if isSelected
            {
                viewMain.backgroundColor = UIColor(red: 0.071, green: 0.604, blue: 0.498, alpha: 1)
                titlePlan.textColor = .white
                label1.textColor = .white
                label2.textColor = .white
                label3.textColor = .white
                label4.textColor = .white
                label5.textColor = .white
                checkFImage.tintColor = UIColor(red: 1, green: 0.659, blue: 0.451, alpha: 1)
                checkFImage2.tintColor = UIColor(red: 1, green: 0.659, blue: 0.451, alpha: 1)
                checkFImage3.tintColor = UIColor(red: 1, green: 0.659, blue: 0.451, alpha: 1)
                checkFImage4.tintColor = UIColor(red: 1, green: 0.659, blue: 0.451, alpha: 1)
                checkFImage5.tintColor = UIColor(red: 1, green: 0.659, blue: 0.451, alpha: 1)
                pricePlan.textColor = .white
                conPrice.textColor = .white
                goStart.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
                goStart.setTitleColor(UIColor(red: 0.071, green: 0.604, blue: 0.498, alpha: 1), for: .normal)
            }else
            {
                viewMain.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
                titlePlan.textColor = UIColor(red: 0.627, green: 0.635, blue: 0.702, alpha: 1)
                label1.textColor = UIColor(red: 0.627, green: 0.635, blue: 0.702, alpha: 1)
                label2.textColor = UIColor(red: 0.627, green: 0.635, blue: 0.702, alpha: 1)
                label3.textColor = UIColor(red: 0.627, green: 0.635, blue: 0.702, alpha: 1)
                label4.textColor = UIColor(red: 0.627, green: 0.635, blue: 0.702, alpha: 1)
                label5.textColor = UIColor(red: 0.627, green: 0.635, blue: 0.702, alpha: 1)
                checkFImage.tintColor = UIColor(red: 0.627, green: 0.635, blue: 0.702, alpha: 1)
                checkFImage2.tintColor = UIColor(red: 0.627, green: 0.635, blue: 0.702, alpha: 1)
                checkFImage3.tintColor = UIColor(red: 0.627, green: 0.635, blue: 0.702, alpha: 1)
                checkFImage4.tintColor = UIColor(red: 0.627, green: 0.635, blue: 0.702, alpha: 1)
                checkFImage5.tintColor = UIColor(red: 0.627, green: 0.635, blue: 0.702, alpha: 1)
                pricePlan.textColor = UIColor(red: 0.627, green: 0.635, blue: 0.702, alpha: 1)
                conPrice.textColor = UIColor(red: 0.627, green: 0.635, blue: 0.702, alpha: 1)
                goStart.backgroundColor = UIColor(red: 0.071, green: 0.604, blue: 0.498, alpha: 1)
                goStart.setTitleColor(.white, for: .normal)
            }
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @objc func pay()
    {
        let payVC = UIStoryboard(name: "ScreensApp", bundle: nil).instantiateViewController(withIdentifier: "PaymentNavigationController") as! PaymentNavigationController
        payVC.modalPresentationStyle = .fullScreen
        VC.present(payVC, animated: true, completion: nil)
    }
}
