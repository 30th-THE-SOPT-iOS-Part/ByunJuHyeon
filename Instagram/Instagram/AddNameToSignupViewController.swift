//
//  AddNameToSignupViewController.swift
//  Instagram
//
//  Created by 변주현 on 2022/04/07.
//

import UIKit

class AddNameToSignupViewController: UIViewController {

    @IBOutlet weak var userIdTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    var userName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTextFieldOption()
        // 다음 버튼 비활성화
        nextButton.isEnabled = false
        addActionToTextField()
    }
    
    private func setTextFieldOption() {
        // TextField에 입력하면 Clear 버튼이 나오도록 표시
        userIdTextField.clearButtonMode = .whileEditing
    }
    
    private func addActionToTextField() {
        // TextField에 이벤트 감지 시 함수 실행을 위한 addTarget() 설정
        self.userIdTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
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
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "Signup2ViewController") as? AddPasswordToSignupViewController else { return }
        
        // 회원가입(2) VC로 사용자 이름 전달
        nextVC.userId = userIdTextField.text
        
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
}
