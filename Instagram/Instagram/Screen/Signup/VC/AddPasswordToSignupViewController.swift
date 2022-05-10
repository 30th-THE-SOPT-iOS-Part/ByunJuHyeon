//
//  AddPasswordToSignupViewController.swift
//  Instagram
//
//  Created by 변주현 on 2022/04/07.
//

import UIKit

class AddPasswordToSignupViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    // MARK: - Properties
    var userId: String?
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addActionToTextField()
    }
}

// MARK: - IBAction
extension AddPasswordToSignupViewController {
    @IBAction func backButtonDidTap(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func nextButtonDidTap(_ sender: Any) {
        guard let welcomeVC = self.storyboard?.instantiateViewController(withIdentifier: WelcomeViewController.className) as? WelcomeViewController else { return }
        
        welcomeVC.modalPresentationStyle = .fullScreen
        // 회원가입(1)에서 받아온 사용자 id와 비밀번호를 로그인 완료 VC로 전달
        welcomeVC.userId = userId
        welcomeVC.password = passwordTextField.text
        
        self.present(welcomeVC, animated: true, completion: nil)
        self.navigationController?.popToRootViewController(animated: true)
    }
}

// MARK: - Custom Methods
extension AddPasswordToSignupViewController {
    private func addActionToTextField() {
        // TextField에 이벤트 감지 시 함수 실행을 위한 addTarget() 설정
        self.passwordTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    @objc func textFieldDidChange(sender: UITextField) {
        self.nextButton.isEnabled = sender.hasText
    }
}
