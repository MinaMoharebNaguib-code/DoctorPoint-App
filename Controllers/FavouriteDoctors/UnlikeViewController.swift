//
//  UnlikeViewController.swift
//  DoctorPoint
//
//  Created by Mina Mohareb on 30/05/2022.
//

import UIKit

class UnlikeViewController: UIViewController {

    @IBOutlet weak var unlikeView: UIView!
    {
        didSet
        {
            unlikeView.layer.cornerRadius = 25
        }
    }
    @IBOutlet weak var checkView: UIView!
    {
        didSet
        {
            checkView.layer.cornerRadius = checkView.frame.height / 2
        }
    }
    @IBOutlet weak var cancelButton: UIButton!
    {
        didSet
        {
            cancelButton.layer.cornerRadius = 10
            cancelButton.layer.borderWidth = 1
            cancelButton.layer.borderColor = UIColor(red: 0.627, green: 0.635, blue: 0.702, alpha: 0.2).cgColor
            cancelButton.addTarget(self, action: #selector(self.cancel), for: .touchUpInside)
        }
    }
    @IBOutlet weak var unlistButton: UIButton!
    {
        didSet
        {
            unlistButton.layer.cornerRadius = 10
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @objc func cancel()
    {
        dismiss(animated: true)
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
