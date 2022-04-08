//
//  SigninViewController.swift
//  Instagram
//
//  Created by 변주현 on 2022/04/07.
//

import UIKit

class SigninViewController: UIViewController {

    @IBOutlet weak var welcomeLabel: UILabel!
    var userId: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setWelcomeLabel()
    }
    
    @IBAction func okButtonDidTap(_ sender: Any) {
        let presentingVC = self.presentingViewController!
        let navigationController = presentingVC is UINavigationController ? presentingVC as? UINavigationController : presentingVC.navigationController
        
        self.dismiss(animated: true){
            navigationController?.popToRootViewController(animated: true)
            return
        }
    }
    
    private func setWelcomeLabel() {
         if let userId = userId {
             welcomeLabel.text = "\(userId)님 Instagram에 오신 것을 환영합니다"
             welcomeLabel.sizeToFit()
         }
     }
    
}
