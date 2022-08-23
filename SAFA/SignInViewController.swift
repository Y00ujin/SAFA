//
//  ViewController.swift
//  SAFA
//
//  Created by 김유진 on 2022/08/21.
//

import UIKit
import Then
import SnapKit

class SignInViewController: UIViewController {
    
    // MARK: - Properties
    private let screenWidth = UIScreen.main.bounds.width
    private let screenHeight = UIScreen.main.bounds.height
    
    private lazy var signInImageView = UIImageView().then {
        $0.image = UIImage(named: "SAFA_SignInImage")
    }
    
    private lazy var createAccountLabel = UILabel().then {
        $0.text = "SAFA 계정을 생성합니다."
        $0.font = UIFont(name: "AppleSDGothicNeo-Light", size: 13)
        $0.textColor = UIColor(red: 80/255, green: 80/255, blue: 80/255, alpha: 1)
    }
    
    private lazy var emailInputView = InputView().then {
        $0.inputTextField.placeholder = "이메일을 입력해주세요."
    }
    
    private lazy var passwardInputView = InputView().then {
        $0.inputTextField.placeholder = "비밀번호를 입력해주세요."
    }
    
    private lazy var passwardAgainInputView = InputView().then {
        $0.inputTextField.placeholder = "비밀번호를 다시 입력해주세요."
    }
    
    private lazy var signInButton = UIButton().then {
        $0.setTitle("계 정  만 들 기", for: .normal)
        $0.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 12)
        $0.titleLabel?.textColor = .white
        $0.backgroundColor = UIColor(red: 145/255, green: 153/255, blue: 133/255, alpha: 1)
        $0.layer.cornerRadius = screenHeight/19.33/2
        $0.addTarget(self, action: #selector(signInButtonClicked(sender:)), for: .touchUpInside)
    }

    // MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        
        addSubView()
        addLocation()
    }

    // MARK: - addSubView
    private func addSubView(){
        view.addSubview(signInImageView)
        view.addSubview(createAccountLabel)
        view.addSubview(emailInputView)
        view.addSubview(passwardInputView)
        view.addSubview(passwardAgainInputView)
        view.addSubview(signInButton)
    }
    
    // MARK: - addLocation
    private func addLocation(){
        signInImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(screenHeight/3.44)
            $0.height.equalToSuperview().dividedBy(27.06)
            $0.width.equalToSuperview().dividedBy(4)
            $0.centerX.equalToSuperview()
        }
        
        createAccountLabel.snp.makeConstraints {
            $0.top.equalTo(signInImageView.snp.bottom).offset(screenHeight/81.2)
            $0.centerX.equalToSuperview()
        }
        
        emailInputView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(createAccountLabel.snp.bottom).offset(screenHeight/20.3)
            $0.height.equalToSuperview().dividedBy(19.33)
            $0.width.equalToSuperview().dividedBy(1.59)
        }
        
        passwardInputView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(emailInputView.snp.bottom).offset(screenHeight/60.3)
            $0.height.equalToSuperview().dividedBy(19.33)
            $0.width.equalToSuperview().dividedBy(1.59)
        }
        
        passwardAgainInputView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(passwardInputView.snp.bottom).offset(screenHeight/60.3)
            $0.height.equalToSuperview().dividedBy(19.33)
            $0.width.equalToSuperview().dividedBy(1.59)
        }
        
        signInButton.snp.makeConstraints {
            $0.top.equalTo(passwardAgainInputView.snp.bottom).offset(screenHeight/20.3)
            $0.width.equalToSuperview().dividedBy(1.59)
            $0.height.equalToSuperview().dividedBy(19.33)
            $0.centerX.equalToSuperview()
        }
    }
    
    @objc private func signInButtonClicked(sender: UIButton){
        let nvc = LoginInViewController()
        self.navigationController?.pushViewController(nvc, animated: true)
    }
}

