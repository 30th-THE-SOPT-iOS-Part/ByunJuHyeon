//
//  WelcomeViewController.swift
//  Instagram
//
//  Created by 변주현 on 2022/04/07.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet weak var welcomeLabel: UILabel!
    
    // MARK: - Properties
    var userId: String?
    var password: String?
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setWelcomeLabel()
    }
}

// MARK: - IBAction
extension WelcomeViewController {
    @IBAction func okButtonDidTap(_ sender: Any) {
        if let email = userId, let password = password {
            // 비밀번호가 왔으면 회원가입을 한 것이므로 회원 가입 서버 통신 필요
            signup(email, password)
        } else {
            goToTabBarController()
        }
    }
    
    @IBAction func reloginButtonDidTap(_ sender: Any) {
        self.dismiss(animated: true)
    }
}

// MARK: - Custom Methods
extension WelcomeViewController {
    private func setWelcomeLabel() {
        if let userId = userId?.components(separatedBy: "@")[0] {
            welcomeLabel.text = "\(userId)님 Instagram에 오신 것을 환영합니다"
            welcomeLabel.sizeToFit()
        }
    }
    
    private func goToTabBarController() {
        guard let tabBarController = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "TabBarController") as? TabBarController else { return }
        
        self.view.window?.rootViewController = tabBarController
    }
    
    private func successAlert(_ message: String) {
        let message = message
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let confirm = UIAlertAction(title: "확인", style: .default, handler: { (action) -> Void in
            self.dismiss(animated: true)
        })
        
        alert.addAction(confirm)
        present(alert, animated: true, completion: nil)
    }
}

// MARK: - Network
extension WelcomeViewController {
    func signup(_ email: String, _ password: String) {
        SignAPI.shared.signup(
            email: email,
            password: password) { response in
                switch response {
                case .success(_):
                    self.successAlert("회원가입 성공")
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
