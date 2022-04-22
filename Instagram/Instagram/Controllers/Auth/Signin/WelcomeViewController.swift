//
//  WelcomeViewController.swift
//  Instagram
//
//  Created by 변주현 on 2022/04/07.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    // MARK: - Properties
    @IBOutlet weak var welcomeLabel: UILabel!
    var userId: String?
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setWelcomeLabel()
    }
}

// MARK: - Custom Methods
extension WelcomeViewController {
    private func setWelcomeLabel() {
        if let userId = userId {
            welcomeLabel.text = "\(userId)님 Instagram에 오신 것을 환영합니다"
            welcomeLabel.sizeToFit()
        }
    }
}

// MARK: - IBAction
extension WelcomeViewController {
    @IBAction func okButtonDidTap(_ sender: Any) {
        guard let tabBarController = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "TabBarController") as? TabBarController else { return }
        
        self.view.window?.rootViewController = tabBarController
    }
    
    @IBAction func reloginButtonDidTap(_ sender: Any) {
        self.dismiss(animated: true)
    }
}
