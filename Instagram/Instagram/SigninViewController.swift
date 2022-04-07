//
//  ViewController.swift
//  Instagram
//
//  Created by 변주현 on 2022/04/07.
//

import UIKit

class SigninViewController: UIViewController {

    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        passwordTextField.isSecureTextEntry = true
    }

    @IBAction func signInButton(_ sender: Any) {
        guard let successVC = self.storyboard? .instantiateViewController(withIdentifier: "SuccessViewController") as? SuccessViewController else { return }
        
        successVC.modalPresentationStyle = .fullScreen
        
        self.present(successVC, animated: true, completion: nil)
    }
    
    @IBAction func signupButton(_ sender: Any) {
        guard let signupVC = self.storyboard?.instantiateViewController(withIdentifier: "Signup1ViewController") as? Signup1ViewController else { return }
        
            self.navigationController?.pushViewController(signupVC, animated: true)
    }

}
