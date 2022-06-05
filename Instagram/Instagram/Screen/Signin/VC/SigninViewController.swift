//
//  SigninViewController.swift
//  Instagram
//
//  Created by 변주현 on 2022/04/07.
//

import UIKit

class SigninViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signinButton: UIButton!
    @IBOutlet weak var passwordEyeButton: UIButton!
    
    // MARK: - Life Cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        resetTextField()
        resetButton()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addActionToTextField()
    }
}

// MARK: - IBAction
extension SigninViewController {
    @IBAction func passwordEyeButtonDidTap(_ sender: Any) {
        // textField에 대한 처리를 true -> false || false -> true
        passwordTextField.isSecureTextEntry.toggle()
        // eyeButton isSelected 값 반전
        passwordEyeButton.isSelected.toggle()
        // 버튼 선택 유무에 따른 눈 모양 이미지 변경
        let eyeImage = passwordEyeButton.isSelected ? "icn_password_shown" : "icn_password_hidden"
        passwordEyeButton.setImage(UIImage(named: eyeImage), for: .normal)
        // 선택 시 틴트 컬러를 투명으로 변경해줌
        passwordEyeButton.tintColor = .clear
    }
    
    @IBAction func signinButtonDidTap(_ sender: Any) {
        if let email = idTextField.text, let password = passwordTextField.text {        signin(email, password)
        }
    }
    
    @IBAction func signupButtonDidTap(_ sender: Any) {
        guard let signupVC = self.storyboard?.instantiateViewController(withIdentifier: AddNameToSignupViewController.className) as? AddNameToSignupViewController else { return }
        
        self.navigationController?.pushViewController(signupVC, animated: true)
    }
}

// MARK: - Custom Methods
extension SigninViewController {
    private func resetTextField() {
        idTextField.text?.removeAll()
        passwordTextField.text?.removeAll()
    }
    
    private func resetButton() {
        signinButton.isEnabled = false
    }
    
    private func addActionToTextField() {
        // TextField에 이벤트 감지 시 함수 실행을 위한 addTarget() 설정
        self.idTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        self.passwordTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    @objc func textFieldDidChange(sender: UITextField) {
        self.signinButton.isEnabled = (idTextField.hasText && passwordTextField.hasText)
    }
    
    private func goToWelcomeVC(userId: String) {
        guard let welcomeVC = self.storyboard?.instantiateViewController(withIdentifier: WelcomeViewController.className) as? WelcomeViewController else { return }
        
        welcomeVC.modalPresentationStyle = .fullScreen
        
        // 로그인 완료 VC로 사용자 이름(id) 전달
        welcomeVC.userId = userId
        
        self.present(welcomeVC, animated: true, completion: nil)
    }
}

// MARK: - Network
extension SigninViewController {
    func signin(_ email: String, _ password: String) {
        SignAPI.shared.signin(
            email: email,
            password: password) { response in
                switch response {
                case .success(let data):
                    guard let data = data as? GenericResponse<SigninResponseModel> else { return }
                    // 로그인 성공시 welcomeVC로 이동, 사용자 id 전달
                    guard let name = data.data?.name else { return }
                    self.goToWelcomeVC(userId: name)
                case .requestErr(let err):
                    print(err)
                case .pathErr:
                    print("pathErr")
                case .serverErr:
                    print("serverErr")
                case .networkFail:
                    print("networkFail")
                }
            }
    }
}
