//
//  Signup1ViewController.swift
//  Instagram
//
//  Created by 변주현 on 2022/04/07.
//

import UIKit

class Signup1ViewController: UIViewController {

    @IBOutlet weak var userIdTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    var userName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 다음 버튼 비활성화
        nextButton.isEnabled = false
    }
    
    @IBAction func backButtonOnClick(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func nextButtonOnClick(_ sender: Any) {
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "Signup2ViewController") as? Signup2ViewController else { return }
        
        // 회원가입(2) VC로 사용자 이름 전달
        nextVC.userId = userIdTextField.text
        
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
}
