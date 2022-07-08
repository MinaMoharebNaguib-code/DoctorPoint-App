//
//  ViewDoctorViewController.swift
//  DoctorPoint
//
//  Created by Mina Mohareb on 17/05/2022.
//

import UIKit

class ViewDoctorViewController: UIViewController {
    
    //var dataLabel = ["Dr. Mahmud Nik is the top most Cardiologist specialist in Dhaka Medical College Hospital at Dhaka.\n He achived several awards for his wonderful contribution in his own field.\n He is avaliable for private consultation.","Mon - Fri 09.00 AM - 08.00 PM"]
    var dataLabel = ["Dr. Mahmud Nik is the top most Cardiologist specialist in Dhaka Medical College Hospital at Dhaka. He achived several awards for his wonderful contribution in his own field. He is avaliable for private consultation.", "Mon - Fri 09.00 AM - 08.00 PM"]
    @IBOutlet weak var loveBtn: UIButton!
    {
        didSet
        {
            loveBtn.layer.cornerRadius = 10
            loveBtn.backgroundColor = UIColor(red: 0.071, green: 0.604, blue: 0.498, alpha: 0.1)
        }
    }
    @IBOutlet weak var bookBtn: UIButton!
    {
        didSet
        {
            bookBtn.layer.cornerRadius = 10
        }
    }
    @IBOutlet weak var viewDesignMain: UIView!
    {
        didSet
        {
            viewDesignMain.layer.cornerRadius = 40
            viewDesignMain.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        }
    }
    @IBOutlet weak var viewDesign: UIView!
    {
        didSet
        {
            viewDesign.layer.cornerRadius = 40
            viewDesign.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        }
    }
    @IBOutlet weak var patientsLBL: UILabel!
    @IBOutlet weak var experiencesLBL: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var viewP: UIView!
    {
        didSet
        {
            viewP.layer.cornerRadius = viewP.frame.height / 2
        }
    }
    @IBOutlet weak var viewE: UIView!
    {
        didSet
        {
            viewE.layer.cornerRadius = viewE.frame.height / 2
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setNavigation()
        setup()
    }
    func setup()
    {
        collectionView.register(UINib(nibName: "LabelCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "LabelCollectionViewCell")
        collectionView.register(UINib(nibName: "DateCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "DateCollectionViewCell")
        collectionView.register(UINib(nibName: "HeaderCollectionReusableView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderCollectionReusableView")
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.reloadData()
    }
    @IBAction func loveButton(_ sender: UIButton) {
    }
    @IBAction func bookAppointmentButton(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "AppointmentBookViewController") as! AppointmentBookViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    func setNavigation()
    {
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: viewBackNavigationItem())
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
        dismiss(animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func requiredHeight(text:String , cellWidth : CGFloat) -> CGFloat {

        let font = UIFont.systemFont(ofSize: 16, weight: .regular)
            let label:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: cellWidth, height: .greatestFiniteMagnitude))
            label.numberOfLines = 0
            label.lineBreakMode = .byWordWrapping
            label.font = font
            label.text = text
            label.sizeToFit()
            return label.frame.height

        }

}
extension ViewDoctorViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 2
        {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DateCollectionViewCell", for: indexPath) as! DateCollectionViewCell
            return cell
        }else
        {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LabelCollectionViewCell", for: indexPath) as! LabelCollectionViewCell
            cell.labelData.text = dataLabel[indexPath.section]
            return cell
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 2
        {
            return CGSize(width: UIScreen.main.bounds.width - 24, height: 86)
        }else
        {
            let hightText = requiredHeight(text: dataLabel[indexPath.section], cellWidth: UIScreen.main.bounds.width - 24)
            return CGSize(width: UIScreen.main.bounds.width - 24, height: hightText)
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 30
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 0)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize
    {
        return CGSize(width: UIScreen.main.bounds.width, height: 50)
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView
    {

        if indexPath.section == 0
        {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderCollectionReusableView", for: indexPath) as! HeaderCollectionReusableView
            header.label.text = "About doctor"
            header.button.isHidden = true
            return header
        }else if indexPath.section == 1
        {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderCollectionReusableView", for: indexPath) as! HeaderCollectionReusableView
            header.label.text = "Working time"
            header.button.isHidden = true
            return header
        }else
        {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderCollectionReusableView", for: indexPath) as! HeaderCollectionReusableView
            header.label.text = "June"
            header.button.isHidden = false
            return header
        }
    }
}
