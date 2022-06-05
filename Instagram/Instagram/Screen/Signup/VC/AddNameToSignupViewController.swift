//
//  AddNameToSignupViewController.swift
//  Instagram
//
//  Created by 변주현 on 2022/04/07.
//

import UIKit

class AddNameToSignupViewController: UIViewController {

    // MARK: - IBOutlet
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    // MARK: - Properties
    var userName: String?
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addActionToTextField()
    }
}

// MARK: - IBAction
extension AddNameToSignupViewController {
    @IBAction func backButtonDidTap(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func nextButtonDidTap(_ sender: Any) {
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: AddPasswordToSignupViewController.className) as? AddPasswordToSignupViewController else { return }
        
        // 회원가입(2) VC로 사용자 이름 전달
        nextVC.userId = idTextField.text
        
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
}

// MARK: - Custom Methods
extension AddNameToSignupViewController {
    private func addActionToTextField() {
        // TextField에 이벤트 감지 시 함수 실행을 위한 addTarget() 설정
        self.idTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    @objc func textFieldDidChange(sender: UITextField) {
        self.nextButton.isEnabled = sender.hasText
    }
}
