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
        
        // TextField에 이벤트 감지 함수 addTarget() 붙이기
        self.passwordTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    @objc func textFieldDidChange(sender: UITextField) {
        if sender.text?.isEmpty == true {
            self.nextButton.isEnabled = false
        } else {
            self.nextButton.isEnabled = true
        }
    }

    @IBAction func backButtonDidTap(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func nextButtonDidTap(_ sender: Any) {
        guard let signinVC = self.storyboard?.instantiateViewController(withIdentifier: "SigninViewController") as? SigninViewController else { return }
        
        signinVC.modalPresentationStyle = .fullScreen
        // 회원가입(1)에서 받아온 사용자 id를 로그인 완료 VC로 전달
        signinVC.userId = userId
        
        self.present(signinVC, animated: true, completion: nil)
    }
    
}
