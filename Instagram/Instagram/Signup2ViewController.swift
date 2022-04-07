//
//  Signup2ViewController.swift
//  Instagram
//
//  Created by 변주현 on 2022/04/07.
//

import UIKit

class Signup2ViewController: UIViewController {

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    var userId: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 다음 버튼 비활성화
        nextButton.isEnabled = false
    }

    @IBAction func backButtonOnClick(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func nextButtonOnClick(_ sender: Any) {
        guard let signinVC = self.storyboard?.instantiateViewController(withIdentifier: "SigninViewController") as? SigninViewController else { return }
        
        signinVC.modalPresentationStyle = .fullScreen
        // 회원가입(1)에서 받아온 사용자 id를 로그인 완료 VC로 전달
        signinVC.userId = userId
        
        self.present(signinVC, animated: true, completion: nil)
    }
    
}
