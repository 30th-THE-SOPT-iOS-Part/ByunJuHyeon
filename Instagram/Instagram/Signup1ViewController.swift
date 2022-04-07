//
//  Signup1ViewController.swift
//  Instagram
//
//  Created by 변주현 on 2022/04/07.
//

import UIKit

class Signup1ViewController: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func backButton(_ sender: Any) {
        self.navigationController? .popViewController(animated: true)
    }
    
    @IBAction func nextButton(_ sender: Any) {
        guard let nextVC = self.storyboard? .instantiateViewController(withIdentifier: "Signup2ViewController") as? Signup2ViewController else { return }
                
        self.navigationController? .pushViewController(nextVC, animated: true)
    }
    
}
