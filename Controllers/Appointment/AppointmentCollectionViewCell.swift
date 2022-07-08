//
//  AppointmentCollectionViewCell.swift
//  DoctorPoint
//
//  Created by Mina Mohareb on 11/05/2022.
//

import UIKit

class AppointmentCollectionViewCell: UICollectionViewCell {

    enum TypeAppointmentType{
        case Accepted, InProgress, Decline
    }
    
    enum TypeAppointment{
        case Voice, Messaging, Video
    }
    
    var myMutableStringAccepted = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 10, weight: .regular), NSAttributedString.Key.foregroundColor : #colorLiteral(red: 0.07058823529, green: 0.6039215686, blue: 0.4980392157, alpha: 1)]
    var myMutableStringInProgress = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 10, weight: .regular), NSAttributedString.Key.foregroundColor : #colorLiteral(red: 0.3333333333, green: 0.3294117647, blue: 0.8588235294, alpha: 1)]
    var myMutableStringDecline = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 10, weight: .regular), NSAttributedString.Key.foregroundColor : #colorLiteral(red: 1, green: 0.6588235294, blue: 0.4509803922, alpha: 1)]
    var myMutableStringType = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 10, weight: .regular), NSAttributedString.Key.foregroundColor : #colorLiteral(red: 0.6274509804, green: 0.6352941176, blue: 0.7019607843, alpha: 1)]
    var myMutableStringName = NSMutableAttributedString()
    
    @IBOutlet weak var viewAppointment: UIView!
    {
        didSet
        {
            viewAppointment.layer.cornerRadius = 10
        }
    }
    @IBOutlet weak var imageAppointment: UIImageView!
    {
        didSet
        {
            imageAppointment.layer.cornerRadius = 20
        }
    }
    @IBOutlet weak var viewType: UIView!
    {
        didSet
        {
            viewType.layer.cornerRadius = 10
        }
    }
    @IBOutlet weak var viewTypeT: UIView!
    {
        didSet
        {
            viewTypeT.layer.cornerRadius = 10
        }
    }
    @IBOutlet weak var imageType: UIImageView!
    @IBOutlet weak var labelType: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func typeAppointmentType(_ appointmentType: TypeAppointmentType)
    {
        switch appointmentType
        {
        case .Accepted:
            myMutableStringName.append(NSMutableAttributedString(string:" Accepted", attributes:myMutableStringAccepted))
        case .InProgress:
            myMutableStringName.append(NSMutableAttributedString(string:" In Progress", attributes:myMutableStringInProgress))
        case .Decline:
            myMutableStringName.append(NSMutableAttributedString(string:" Decline", attributes:myMutableStringDecline))
        }
    }
    
    func typeAppointment(_ typeAppointment: TypeAppointment, appointmentType: TypeAppointmentType)
    {
        if typeAppointment == .Voice
        {
            self.imageType.image = UIImage(named: "Voice")
            self.viewTypeT.backgroundColor = #colorLiteral(red: 0.3333333333, green: 0.3294117647, blue: 0.8588235294, alpha: 1)
            myMutableStringName = NSMutableAttributedString(string:"Voice Call -", attributes: myMutableStringType)
            typeAppointmentType(appointmentType)
            labelType.attributedText = myMutableStringName
        }else if typeAppointment == .Messaging
        {
            self.imageType.image = UIImage(named: "Messaging")
            self.viewTypeT.backgroundColor = #colorLiteral(red: 1, green: 0.6588235294, blue: 0.4509803922, alpha: 1)
            myMutableStringName = NSMutableAttributedString(string:"Messaging -", attributes: myMutableStringType)
            typeAppointmentType(appointmentType)
            labelType.attributedText = myMutableStringName
        }else if typeAppointment == .Video
        {
            self.imageType.image = UIImage(named: "Video")
            self.viewTypeT.backgroundColor = #colorLiteral(red: 0.6274509804, green: 0.4745098039, blue: 0.9254901961, alpha: 1)
            myMutableStringName = NSMutableAttributedString(string:"Video Call -", attributes: myMutableStringType)
            typeAppointmentType(appointmentType)
            labelType.attributedText = myMutableStringName
        }
    }

}
