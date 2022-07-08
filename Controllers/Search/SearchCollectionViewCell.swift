//
//  SearchCollectionViewCell.swift
//  DoctorPoint
//
//  Created by Mina Mohareb on 07/05/2022.
//

import UIKit

class SearchCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var viewSearch: UIView!
    {
        didSet
        {
            viewSearch.layer.cornerRadius = 10
        }
    }
    //    var myStringName:NSString = "Dr. Mina Mohareb"
    var myStringDescription:NSString = "Cardiologist - Dhaka Medical Colleege\nHospital"
    var myMutableStringName1 = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 18, weight: .semibold), NSAttributedString.Key.foregroundColor : #colorLiteral(red: 0.07058823529, green: 0.6039215686, blue: 0.4980392157, alpha: 1)]
    var myMutableStringName2 = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 18, weight: .medium), NSAttributedString.Key.foregroundColor : #colorLiteral(red: 0.4666666667, green: 0.4784313725, blue: 0.5843137255, alpha: 1)]
    //var myMutableStringDescription1 : NSMutableAttributedString?
    //var myMutableStringDescription2 = NSMutableAttributedString()
    @IBOutlet weak var imageDoctor: UIImageView!
    {
        didSet
        {
            imageDoctor.layer.cornerRadius = 20
        }
    }
    @IBOutlet weak var viewOnline: UIView!
    {
        didSet
        {
            viewOnline.layer.cornerRadius = viewOnline.frame.height / 2
        }
    }
    @IBOutlet weak var online: UIView!
    {
        didSet
        {
            online.layer.cornerRadius = online.frame.height / 2
        }
    }
    @IBOutlet weak var nameDoctor: UILabel!
    @IBOutlet weak var reviewDoctor: UILabel!
    @IBOutlet weak var descriptionDoctor: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        let myMutableStringName = NSMutableAttributedString(string:"Dr", attributes: myMutableStringName1)
        myMutableStringName.append(NSMutableAttributedString(string:". Mina Mohareb", attributes:myMutableStringName2))
        nameDoctor.attributedText = myMutableStringName
        let myMutableStringDescription1 = NSMutableAttributedString(string: self.myStringDescription as String, attributes: [NSAttributedString.Key.font :UIFont.systemFont(ofSize: 12, weight: .regular)])
        myMutableStringDescription1.addAttribute(NSAttributedString.Key.foregroundColor, value: #colorLiteral(red: 0.4666666667, green: 0.4784313725, blue: 0.5843137255, alpha: 1), range: NSRange(location:0,length:14))
        descriptionDoctor.attributedText = myMutableStringDescription1
        // Initialization code
    }

}
