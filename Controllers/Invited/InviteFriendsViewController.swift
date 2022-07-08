//
//  InviteFriendsViewController.swift
//  DoctorPoint
//
//  Created by Mina Mohareb on 01/06/2022.
//

import UIKit

class InviteFriendsViewController: UIViewController {
    var selectedIndex = -1
    var contactsRec = UITapGestureRecognizer()
    var facebookRec = UITapGestureRecognizer()
    @IBOutlet weak var stackViewInvite: UIStackView!
    @IBOutlet weak var contactsView: UIView!
    {
        didSet
        {
            contactsView.layer.cornerRadius = 10
        }
    }
    @IBOutlet weak var facebookView: UIView!
    {
        didSet
        {
            facebookView.layer.cornerRadius = 10
        }
    }
    @IBOutlet weak var viewContacts: UIView!
    {
        didSet
        {
            viewContacts.layer.cornerRadius = 10
        }
    }
    @IBOutlet weak var viewFacebook: UIView!
    {
        didSet
        {
            viewFacebook.layer.cornerRadius = 10
        }
    }
    @IBOutlet weak var contactsImageCustom: UIImageView!
    @IBOutlet weak var contactsLabel: UILabel!
    @IBOutlet weak var facebookLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "Invite a friend"
        self.navigationController?.navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor(red: 0.467, green: 0.478, blue: 0.584, alpha: 1),
            .font: UIFont.systemFont(ofSize: 24, weight: .semibold)
        ]
        setNavigation()
        setup()
    }
    func setup()
    {
        // Collection Data
        collectionView.register(UINib(nibName: "InviteCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "InviteCollectionViewCell")
        collectionView.backgroundColor = .clear
        collectionView.delegate = self
        collectionView.dataSource = self
        /// Setup
        contactsView.isUserInteractionEnabled = true
        facebookView.isUserInteractionEnabled = true
        contactsView.addGestureRecognizer(contactsRec)
        facebookView.addGestureRecognizer(facebookRec)
        selectedIndex = 0
        contactsView.backgroundColor = #colorLiteral(red: 0.07058823529, green: 0.6039215686, blue: 0.4980392157, alpha: 1)
        contactsView.layer.borderWidth = 1
        contactsView.layer.borderColor = UIColor(red: 0.667, green: 0.671, blue: 0.671, alpha: 0.2).cgColor
        contactsLabel.textColor = .white
        contactsImageCustom.tintColor = #colorLiteral(red: 0.07058823529, green: 0.6039215686, blue: 0.4980392157, alpha: 1)
        facebookView.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        facebookView.layer.borderWidth = 1
        facebookView.layer.borderColor = UIColor(red: 0.627, green: 0.635, blue: 0.702, alpha: 0.2).cgColor
        facebookLabel.tintColor = UIColor(red: 0.627, green: 0.635, blue: 0.702, alpha: 1)
        
        // Rec Function
        contactsRec.addTarget(self, action: #selector(self.contactsData))
        facebookRec.addTarget(self, action: #selector(self.facebookData))
        
    }
    @objc func contactsData()
    {
        selectedIndex = 0
        contactsView.backgroundColor = #colorLiteral(red: 0.07058823529, green: 0.6039215686, blue: 0.4980392157, alpha: 1)
        contactsView.layer.borderWidth = 1
        contactsView.layer.borderColor = UIColor(red: 0.667, green: 0.671, blue: 0.671, alpha: 0.2).cgColor
        contactsLabel.textColor = .white
        contactsImageCustom.tintColor = #colorLiteral(red: 0.07058823529, green: 0.6039215686, blue: 0.4980392157, alpha: 1)
        facebookView.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        facebookView.layer.borderWidth = 1
        facebookView.layer.borderColor = UIColor(red: 0.627, green: 0.635, blue: 0.702, alpha: 0.2).cgColor
        facebookLabel.textColor = UIColor(red: 0.627, green: 0.635, blue: 0.702, alpha: 1)
        collectionView.reloadData()
    }
    @objc func facebookData()
    {
        selectedIndex = 1
        facebookView.backgroundColor = #colorLiteral(red: 0.07058823529, green: 0.6039215686, blue: 0.4980392157, alpha: 1)
        facebookView.layer.borderWidth = 1
        facebookView.layer.borderColor = UIColor(red: 0.667, green: 0.671, blue: 0.671, alpha: 0.2).cgColor
        facebookLabel.textColor = .white
        contactsImageCustom.tintColor = UIColor(red: 0.627, green: 0.635, blue: 0.702, alpha: 1)
        contactsView.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        contactsView.layer.borderWidth = 1
        contactsView.layer.borderColor = UIColor(red: 0.627, green: 0.635, blue: 0.702, alpha: 0.2).cgColor
        contactsLabel.textColor = UIColor(red: 0.627, green: 0.635, blue: 0.702, alpha: 1)
        collectionView.reloadData()
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
        self.dismiss(animated: true)
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
extension InviteFriendsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if selectedIndex == 0
        {
            return 7
        }else
        {
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if selectedIndex == 0
        {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "InviteCollectionViewCell", for: indexPath) as! InviteCollectionViewCell
            return cell
        } else
        {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "InviteCollectionViewCell", for: indexPath) as! InviteCollectionViewCell
            return cell
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat
    {
        return 16
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets
    {
        return UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 24)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width: UIScreen.main.bounds.width - 48, height: 90)
    }
}
