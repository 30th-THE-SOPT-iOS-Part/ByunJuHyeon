//
//  Signup2ViewController.swift
//  Instagram
//
//  Created by 변주현 on 2022/04/07.
//

import UIKit

class Signup2ViewController: UIViewController {

    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func backButton(_ sender: Any) {
        self.navigationController? .popViewController(animated: true)
    }
    
    @IBAction func nextButton(_ sender: Any) {
        guard let signinVC = self.storyboard? .instantiateViewController(withIdentifier: "SigninViewController") as? SigninViewController else { return }
        
        signinVC.modalPresentationStyle = .fullScreen
        
        self.present(signinVC, animated: true, completion: nil)
    }
    
}
