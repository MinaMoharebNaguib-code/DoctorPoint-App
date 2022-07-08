//
//  SpecialistCollectionViewCell.swift
//  DoctorPoint
//
//  Created by Mina Mohareb on 11/05/2022.
//

import UIKit

class SpecialistCollectionViewCell: UICollectionViewCell {
//    enum TypeSpecialist{
//        case Cardio, Heart, Dental, Physico
//    }
    @IBOutlet weak var viewSpecialist: UIView!
    {
        didSet
        {
            viewSpecialist.layer.cornerRadius = 10
        }
    }
    @IBOutlet weak var imageSpecialist: UIImageView!
    @IBOutlet weak var nameSpecialist: UILabel!
    @IBOutlet weak var numberSpecialist: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

//    func type(_ typeSpecialist: TypeSpecialist)
//    {
//        switch typeSpecialist
//        {
//        case .Cardio:
//            viewSpecialist.backgroundColor = #colorLiteral(red: 0.07058823529, green: 0.6039215686, blue: 0.4980392157, alpha: 1)
//            imageSpecialist.image = UIImage(named: "Cardio")
//            nameSpecialist.text = "Cardio\nSpecialist"
//        case .Heart:
//            viewSpecialist.backgroundColor = #colorLiteral(red: 0.3333333333, green: 0.3294117647, blue: 0.8588235294, alpha: 1)
//            imageSpecialist.image = UIImage(named: "Heart")
//            nameSpecialist.text = "Heart\nIssue"
//        case .Dental:
//            viewSpecialist.backgroundColor = #colorLiteral(red: 1, green: 0.6588235294, blue: 0.4509803922, alpha: 1)
//            imageSpecialist.image = UIImage(named: "Dental")
//            nameSpecialist.text = "Dental\nCare"
//        case .Physico:
//            viewSpecialist.backgroundColor = #colorLiteral(red: 0.6274509804, green: 0.4745098039, blue: 0.9254901961, alpha: 1)
//            imageSpecialist.image = UIImage(named: "Physico")
//            nameSpecialist.text = "Physico\nTherapy"
//        }
//    }
    func type(_ typeSpecialist: Int)
    {
        switch typeSpecialist
        {
        case 0:
            viewSpecialist.backgroundColor = #colorLiteral(red: 0.07058823529, green: 0.6039215686, blue: 0.4980392157, alpha: 1)
            imageSpecialist.image = UIImage(named: "Cardio")
            nameSpecialist.text = "Cardio\nSpecialist"
        case 1:
            viewSpecialist.backgroundColor = #colorLiteral(red: 0.3333333333, green: 0.3294117647, blue: 0.8588235294, alpha: 1)
            imageSpecialist.image = UIImage(named: "Heart-1")
            nameSpecialist.text = "Heart\nIssue"
        case 2:
            viewSpecialist.backgroundColor = #colorLiteral(red: 1, green: 0.6588235294, blue: 0.4509803922, alpha: 1)
            imageSpecialist.image = UIImage(named: "Dental")
            nameSpecialist.text = "Dental\nCare"
        case 3:
            viewSpecialist.backgroundColor = #colorLiteral(red: 0.6274509804, green: 0.4745098039, blue: 0.9254901961, alpha: 1)
            imageSpecialist.image = UIImage(named: "Physico")
            nameSpecialist.text = "Physico\nTherapy"
        default:
            print("Error")
        }
    }
}
