//
//  ViewController.swift
//  Instagram
//
//  Created by 변주현 on 2022/04/07.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signinButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTextFieldOption()
        
        // 로그인 버튼 비활성화
        signinButton.isEnabled = false
        
        // TextField에 이벤트 감지 함수 addTarget() 붙이기
        self.idTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        self.passwordTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    private func setTextFieldOption() {
        // 비밀번호 입력 시 보안처리
        passwordTextField.isSecureTextEntry = true
        
        // TextField에 입력하면 Clear 버튼이 나오도록 표시
        idTextField.clearButtonMode = .whileEditing
        passwordTextField.clearButtonMode = .whileEditing
    }
    
    @objc func textFieldDidChange(sender: UITextField) {
        // 현재 id, password 값 받아오기
        let id = idTextField.text
        let password = passwordTextField.text
        
        // 현재 id 또는 password 값이 있는지 확인
        if id?.isEmpty == true || password?.isEmpty == true{
            self.signinButton.isEnabled = false
        } else {
            self.signinButton.isEnabled = true
        }
    }

    @IBAction func signinButtonDidTap(_ sender: Any) {
        guard let successVC = self.storyboard?.instantiateViewController(withIdentifier: "SigninViewController") as? SigninViewController else { return }
        
        successVC.modalPresentationStyle = .fullScreen
        
        // 로그인 완료 VC로 사용자 id 전달
        successVC.userId = idTextField.text
        
        self.present(successVC, animated: true, completion: nil)
    }
    
    @IBAction func signupButtonDidTap(_ sender: Any) {
        guard let signupVC = self.storyboard?.instantiateViewController(withIdentifier: "Signup1ViewController") as? Signup1ViewController else { return }
        
            self.navigationController?.pushViewController(signupVC, animated: true)
    }

}
