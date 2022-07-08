//
//  NotificationsCollectionViewCell.swift
//  DoctorPoint
//
//  Created by Mina Mohareb on 05/05/2022.
//

import UIKit

protocol sendTotalHeightTable
{
    func sendHeight(_ height: CGFloat)
}

class NotificationsCollectionViewCell: UICollectionViewCell {
    let vc = UIViewController()
    var firstTime: Int = 0
    var delegate : sendTotalHeightTable?
    var titleA = ["Serial reminder","Appointment alarm","Appointment confirmed"]
    var labelA = ["Your serial is successfully added in appointment list. Serial number is 25. DoctorPoint will notice you before 15 minutes.","Your appointment will be start after 15 minutes. Stay with app and take care.","Your Appointment with Dr. Mahmud Nik is confirmed. He will call you at 11:00 AM | 10 June, 2020"]
//    var counter = 0
//    var number = 0
//    var number2 = 0
    @IBOutlet weak var labelDate: UILabel!
//    @IBOutlet weak var collectionView: UICollectionView!
//    {
//        didSet
//        {
//            collectionView.layer.cornerRadius = 10
//            collectionView.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
//        }
//    }
    @IBOutlet weak var tableView: UITableView!
    {
        didSet
        {
            tableView.layer.cornerRadius = 10
            tableView.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        //counter = (titleA.count * 2) - 2
        setup()
    }
    
    func setup()
    {
        tableView.register(UINib(nibName: "NotificationTableViewCell", bundle: nil), forCellReuseIdentifier: "NotificationTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorInset = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        tableView.tableFooterView = customTabelFooterView()
        tableView.reloadData()
    }
    
    func customTabelFooterView() -> UIView
    {
        let footerView = UIView(frame: CGRect(x: 15, y: 0, width: UIScreen.main.bounds.width - 30, height: 1))
        footerView.backgroundColor = .white
        footerView.layer.borderWidth = 1
        footerView.layer.borderColor = UIColor(red: 0.627, green: 0.635, blue: 0.702, alpha: 0.15).cgColor
        return footerView
    }
    
//    func setup()
//    {
//        collectionView.register(UINib(nibName: "NotificationCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "NotificationCollectionViewCell")
//        collectionView.register(UINib(nibName: "SecNovCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SecNovCollectionViewCell")
//        collectionView.delegate = self
//        collectionView.dataSource = self
//        collectionView.reloadData()
//    }
    
    func requiredHeightLabel(text:String , cellWidth : CGFloat) -> CGFloat {

        let font = UIFont.systemFont(ofSize: 12, weight: .regular)
            let label:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: cellWidth, height: .greatestFiniteMagnitude))
            label.numberOfLines = 0
            label.lineBreakMode = .byWordWrapping
            label.font = font
            label.text = text
            label.sizeToFit()
            return label.frame.height

        }
    
    func requiredHeightTitle(text:String , cellWidth : CGFloat) -> CGFloat {

        let font = UIFont.systemFont(ofSize: 16, weight: .semibold)
            let label:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: cellWidth, height: .greatestFiniteMagnitude))
            label.numberOfLines = 0
            label.lineBreakMode = .byWordWrapping
            label.font = font
            label.text = text
            label.sizeToFit()
            return label.frame.height

        }
}
extension NotificationsCollectionViewCell: UITableViewDataSource, UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return labelA.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NotificationTableViewCell", for: indexPath) as! NotificationTableViewCell
        cell.type(.Notification)
        cell.labelDes.text = labelA[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let heTitle = requiredHeightTitle(text: titleA[(indexPath.row)], cellWidth: UIScreen.main.bounds.width - 30)
        let heLabel = requiredHeightLabel(text: labelA[(indexPath.row)], cellWidth: UIScreen.main.bounds.width - 15)
        self.delegate?.sendHeight((heTitle + 2 + heLabel))
        return (heTitle + 2 + heLabel)
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: true)
    }
}


//extension NotificationsCollectionViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
//{
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        if titleA.isEmpty != true
//        {
//            return counter
//        }
//        else
//        {
//            return 0
//        }
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        if indexPath.row % 2 == 0
//        {
//            if number < titleA.count
//            {
//                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NotificationCollectionViewCell", for: indexPath) as! NotificationCollectionViewCell
//                cell.titleType.text = titleA[number]
//                cell.lableType.text = labelA[number]
//                number += 1
//                return cell
//            }else
//            {
//                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NotificationCollectionViewCell", for: indexPath) as! NotificationCollectionViewCell
//                return cell
//            }
//        }else
//        {
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SecNovCollectionViewCell", for: indexPath) as! SecNovCollectionViewCell
//            return cell
//        }
//    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
//    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 15
//    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
//        return CGSize(width: UIScreen.main.bounds.width, height: 15)
//    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
//    {
//        if indexPath.row % 2 == 0
//        {
////            if indexPath.row < titleA.count
////            {
////                let heTitle = requiredHeightTitle(text: titleA[(indexPath.row / 2)], cellWidth: UIScreen.main.bounds.width - 30)
////                let heLabel = requiredHeightLabel(text: labelA[(indexPath.row / 2)], cellWidth: UIScreen.main.bounds.width - 15)
////                return CGSize(width: UIScreen.main.bounds.width - 30, height: heTitle + 2 + heLabel)
////            }else if indexPath.row % 2 == 0
////            {
////                let heTitle = requiredHeightTitle(text: titleA[(indexPath.row / 2) + 1], cellWidth: UIScreen.main.bounds.width - 30)
////                let heLabel = requiredHeightLabel(text: labelA[(indexPath.row / 2) + 1], cellWidth: UIScreen.main.bounds.width - 15)
////                return CGSize(width: UIScreen.main.bounds.width - 30, height: heTitle + 2 + heLabel)
////            }else
////            {
////                return CGSize(width: UIScreen.main.bounds.width - 30, height: 0)
////            }
//            if number2 < titleA.count
//            {
//                let heTitle = requiredHeightTitle(text: titleA[number2], cellWidth: UIScreen.main.bounds.width - 30)
//                let heLabel = requiredHeightLabel(text: labelA[number2], cellWidth: UIScreen.main.bounds.width - 15)
//                number2 += 1
//                return CGSize(width: UIScreen.main.bounds.width - 30, height: heTitle + 2 + heLabel)
//            }else
//            {
//                return CGSize(width: UIScreen.main.bounds.width - 30, height: 1)
//            }
//        }else
//        {
//            return CGSize(width: UIScreen.main.bounds.width - 30, height: 1)
//        }
//    }
//}
