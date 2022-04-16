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
    @IBOutlet weak var passwordEyeButton: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        resetTextField()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTextFieldOption()
        addActionToTextField()
    }
    
    private func resetTextField() {
        idTextField.text?.removeAll()
        passwordTextField.text?.removeAll()
    }
    
    private func setTextFieldOption() {
        // 비밀번호 입력 시 보안처리
        passwordTextField.isSecureTextEntry = true
        // TextField에 입력하면 Clear 버튼이 나오도록 표시
        idTextField.clearButtonMode = .whileEditing
        // 눈 아이콘을 위해 주석 처리함
        // passwordTextField.clearButtonMode = .whileEditing
    }
    
    private func addActionToTextField() {
        // TextField에 이벤트 감지 시 함수 실행을 위한 addTarget() 설정
        self.idTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        self.passwordTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    @objc func textFieldDidChange(sender: UITextField) {
        self.signinButton.isEnabled = (idTextField.hasText && passwordTextField.hasText) ? true : false
    }
    
    @IBAction func passwordEyeButtonDidTap(_ sender: Any) {
        // textField에 대한 처리를 true -> false || false -> true
        passwordTextField.isSecureTextEntry.toggle()
        // eyeButton isSelected 값 반전
        passwordEyeButton.isSelected.toggle()
        // 버튼 선택 유무에 따른 눈 모양 이미지 변경
        let eyeImage = passwordEyeButton.isSelected ? "password shown eye icon" : "password hidden eye icon"
        passwordEyeButton.setImage(UIImage(named: eyeImage), for: .normal)
        // 선택 시 틴트 컬러를 투명으로 변경해줌
        passwordEyeButton.tintColor = .clear
    }

    @IBAction func signinButtonDidTap(_ sender: Any) {
        guard let successVC = self.storyboard?.instantiateViewController(withIdentifier: "SigninViewController") as? SigninViewController else { return }
        
        successVC.modalPresentationStyle = .fullScreen
        
        // 로그인 완료 VC로 사용자 id 전달
        successVC.userId = idTextField.text
        
        self.present(successVC, animated: true, completion: nil)
    }
    
    @IBAction func signupButtonDidTap(_ sender: Any) {
        guard let signupVC = self.storyboard?.instantiateViewController(withIdentifier: "AddNameToSignupViewController") as? AddNameToSignupViewController else { return }
        
            self.navigationController?.pushViewController(signupVC, animated: true)
    }

}
