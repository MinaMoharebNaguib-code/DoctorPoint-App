//
//  HomeViewController.swift
//  DoctorPoint
//
//  Created by Mina Mohareb on 04/05/2022.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var imageProfile: UIImageView!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelD: UILabel!
    @IBOutlet weak var calButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        setup()
    }
    func setup()
    {
        collectionView.backgroundColor = .clear
        collectionView.register(UINib(nibName: "SpecialistsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SpecialistsCollectionViewCell")
        collectionView.register(UINib(nibName: "BannersCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "BannersCollectionViewCell")
        //TopDoctorsCollectionViewCell
        collectionView.register(UINib(nibName: "TopDoctorsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "TopDoctorsCollectionViewCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.reloadData()
    }
    @objc func goDoctors(_ sender: UIButton)
    {
        print("Doctors")
        //let appDelate = UIApplication.shared.delegate as! AppDelegate
        
        let goDoctor = self.storyboard?.instantiateViewController(withIdentifier: "DoctorsViewController") as! DoctorsViewController
        self.navigationController?.pushViewController(goDoctor, animated: true)
        //appDelate.window?.rootViewController = goDoctor
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
extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate , UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0
        {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SpecialistsCollectionViewCell", for: indexPath) as! SpecialistsCollectionViewCell
            cell.contentVC = self
            
            return cell
        }else if indexPath.row == 1
        {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BannersCollectionViewCell", for: indexPath) as! BannersCollectionViewCell
            //cell.contentVC = self
            
            return cell
        }else
        {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopDoctorsCollectionViewCell", for: indexPath) as! TopDoctorsCollectionViewCell
            cell.contentVC = self
            cell.viewAll.addTarget(self, action: #selector(goDoctors(_:)), for: .touchUpInside)
            return cell
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.row == 0
        {
            return CGSize(width: UIScreen.main.bounds.width, height: 165)
        }else if indexPath.row == 1
        {
            return CGSize(width: UIScreen.main.bounds.width, height: 121)
        }else
        {
            return CGSize(width: UIScreen.main.bounds.width, height: 220)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 30
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
//        return CGSize(width: UIScreen.main.bounds.width, height: 30)
//    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 30)
    }
}

//extension HomeViewController: UITableViewDataSource, UITableViewDelegate
//{
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 3
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "SpecialistTableViewCell", for: indexPath) as! SpecialistTableViewCell
//        cell.contentVC = self
//        return cell
//    }
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        if (indexPath.row == 0)
//        {
//            return UIScreen.main.bounds.height / 6
//        }else
//        {
//            return 0
//        }
//    }
//
//}
