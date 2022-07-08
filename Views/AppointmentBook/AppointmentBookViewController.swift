//
//  AppointmentBookViewController.swift
//  DoctorPoint
//
//  Created by Mina Mohareb on 23/05/2022.
//

import UIKit

class AppointmentBookViewController: UIViewController {
    var feesData: [TypeFee] = [.Voice,.Messaging,.Video]
    var selectedIndex = -1
    var dateSelected:Int?
    var priceSelected: Int?
    let morningRec = UITapGestureRecognizer()
    let eveningRec = UITapGestureRecognizer()
    @IBOutlet weak var dateAppointment: UILabel!
    @IBOutlet weak var viewMorning: UIView!
    {
        didSet
        {
            viewMorning.layer.cornerRadius = 10
            viewMorning.layer.borderWidth = 1
            viewMorning.layer.borderColor = UIColor(red: 0.667, green: 0.671, blue: 0.671, alpha: 0.2).cgColor
        }
    }
    @IBOutlet weak var viewEvening: UIView!
    {
        didSet
        {
            viewEvening.layer.cornerRadius = 10
            viewEvening.layer.borderWidth = 1
            viewEvening.layer.borderColor = UIColor(red: 0.667, green: 0.671, blue: 0.671, alpha: 0.2).cgColor
        }
    }
    @IBOutlet weak var viewImageOne: UIView!
    {
        didSet
        {
            viewImageOne.layer.backgroundColor = UIColor(red: 0.965, green: 0.965, blue: 0.965, alpha: 1).cgColor
            viewImageOne.layer.cornerRadius = 10
        }
    }
    @IBOutlet weak var viewEveningTwo: UIView!
    {
        didSet
        {
            viewEveningTwo.layer.backgroundColor = UIColor(red: 0.965, green: 0.965, blue: 0.965, alpha: 1).cgColor
            viewEveningTwo.layer.cornerRadius = 10
        }
    }
    @IBOutlet weak var imageOnew: UIImageView!
    @IBOutlet weak var imageTwow: UIImageView!
    @IBOutlet weak var labelOne: UILabel!
    @IBOutlet weak var labelTwo: UILabel!
    @IBOutlet weak var dateDataCollectionView: UICollectionView!
    @IBOutlet weak var feesCollectionView: UICollectionView!
    @IBOutlet weak var buttonContinue: UIButton!
    {
        didSet
        {
            buttonContinue.backgroundColor = UIColor(red: 0.627, green: 0.635, blue: 0.702, alpha: 0.25)
            buttonContinue.layer.cornerRadius = 10
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.title = "Appointment"
        self.navigationController?.navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor(red: 0.467, green: 0.478, blue: 0.584, alpha: 1),
            .font: UIFont.systemFont(ofSize: 24, weight: .semibold)
        ]
        setNavigation()
        setup()
    }
    func setup()
    {
        buttonContinue.isEnabled = false
        viewMorning.isUserInteractionEnabled = true
        viewEvening.isUserInteractionEnabled = true
        viewMorning.addGestureRecognizer(morningRec)
        viewEvening.addGestureRecognizer(eveningRec)
        morningRec.addTarget(self, action: #selector(self.morningButton))
        eveningRec.addTarget(self, action: #selector(self.eveningButton))
        dateDataCollectionView.register(UINib(nibName: "DateAppointmentCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "DateAppointmentCollectionViewCell")
        dateDataCollectionView.backgroundColor = .clear
        dateDataCollectionView.delegate = self
        dateDataCollectionView.dataSource = self
        dateDataCollectionView.reloadData()
        feesCollectionView.backgroundColor = .clear
        feesCollectionView.register(UINib(nibName: "FeesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "FeesCollectionViewCell")
        feesCollectionView.delegate = self
        feesCollectionView.dataSource = self
        feesCollectionView.reloadData()
    }
    @IBAction func continueButton(_ sender: UIButton) {
        if (selectedIndex == 0 || selectedIndex == 1) && dateSelected != nil && priceSelected != nil
        {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "PatientDetailsViewController") as! PatientDetailsViewController
            self.navigationController?.pushViewController(vc, animated: true)
        }
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
        self.navigationController?.popViewController(animated: true)
    }
    @objc func morningButton()
    {
        selectedIndex = 0
        viewMorning.backgroundColor = UIColor(red: 0.071, green: 0.604, blue: 0.498, alpha: 1)
        imageOnew.tintColor = UIColor(red: 0.071, green: 0.604, blue: 0.498, alpha: 1)
        labelOne.textColor = .white
        viewEvening.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        imageTwow.tintColor = UIColor(red: 0.627, green: 0.635, blue: 0.702, alpha: 1)
        labelTwo.textColor = UIColor(red: 0.627, green: 0.635, blue: 0.702, alpha: 1)
        dateDataCollectionView.reloadData()
        dateSelected = nil
        buttonContinue.isEnabled = false
        buttonContinue.backgroundColor = UIColor(red: 0.627, green: 0.635, blue: 0.702, alpha: 0.25)
    }
    @objc func eveningButton()
    {
        selectedIndex = 1
        viewEvening.backgroundColor = UIColor(red: 0.071, green: 0.604, blue: 0.498, alpha: 1)
        imageTwow.tintColor = UIColor(red: 0.071, green: 0.604, blue: 0.498, alpha: 1)
        labelTwo.textColor = .white
        viewMorning.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        imageOnew.tintColor = UIColor(red: 0.627, green: 0.635, blue: 0.702, alpha: 1)
        labelOne.textColor = UIColor(red: 0.627, green: 0.635, blue: 0.702, alpha: 1)
        dateDataCollectionView.reloadData()
        dateSelected = nil
        buttonContinue.isEnabled = false
        buttonContinue.backgroundColor = UIColor(red: 0.627, green: 0.635, blue: 0.702, alpha: 0.25)
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
extension AppointmentBookViewController : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.dateDataCollectionView
        {
            return 6
        }else
        {
            return feesData.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.dateDataCollectionView
        {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DateAppointmentCollectionViewCell", for: indexPath) as! DateAppointmentCollectionViewCell
            return cell
        }else
        {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FeesCollectionViewCell", for: indexPath) as! FeesCollectionViewCell
            cell.typeFee(typeF: feesData[indexPath.row])
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 24)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        if collectionView == self.dateDataCollectionView
        {
            return CGSize(width: 84, height: 44)
        }else
        {
            return CGSize(width: UIScreen.main.bounds.width - 48, height: 70)
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == self.dateDataCollectionView
        {
            dateSelected = indexPath.row
        }else
        {
            priceSelected = indexPath.row
        }
        if (selectedIndex == 0 || selectedIndex == 1) && dateSelected != nil && priceSelected != nil
        {
            buttonContinue.backgroundColor = UIColor(red: 0.071, green: 0.604, blue: 0.498, alpha: 1)
            buttonContinue.isEnabled = true
        }else
        {
            buttonContinue.isEnabled = false
            buttonContinue.backgroundColor = UIColor(red: 0.627, green: 0.635, blue: 0.702, alpha: 0.25)
        }
    }
}
