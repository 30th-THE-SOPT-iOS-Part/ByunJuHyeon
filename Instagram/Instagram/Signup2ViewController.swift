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
        guard let nextVC = self.storyboard? .instantiateViewController(withIdentifier: "SuccessViewController") as? SuccessViewController else { return }
        
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC, animated: true, completion: nil)
    }
    
}
