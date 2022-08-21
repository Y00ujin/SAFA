//
//  ViewController.swift
//  SAFA
//
//  Created by 김유진 on 2022/08/21.
//

import UIKit
import Then
import SnapKit

final class LoginInViewController: UIViewController {
    
    // MARK: - Properties
    private let screenWidth = UIScreen.main.bounds.width
    private let screenHeight = UIScreen.main.bounds.height
    
    private lazy var logInImageView = UIImageView().then {
        $0.image = UIImage(named: "SAFA_LoginImage")
    }
    
    private lazy var logInAccountLabel = UILabel().then {
        $0.text = "SAFA 앱에 로그인합니다."
        $0.font = UIFont(name: "AppleSDGothicNeo-Light", size: 13)
        $0.textColor = UIColor(red: 80/255, green: 80/255, blue: 80/255, alpha: 1)
    }
    
    private lazy var emailInputView = InputView().then {
        $0.inputTextField.placeholder = "이메일을 입력해주세요."
    }
    
    private lazy var passwardInputView = InputView().then {
        $0.inputTextField.placeholder = "비밀번호를 입력해주세요."
    }
    
    private lazy var logInButton = UIButton().then {
        $0.setTitle("로 그 인  하 기", for: .normal)
        $0.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 12)
        $0.titleLabel?.textColor = .white
        $0.backgroundColor = UIColor(red: 145/255, green: 153/255, blue: 133/255, alpha: 1)
        $0.layer.cornerRadius = screenHeight/19.33/2
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
        view.addSubview(logInImageView)
        view.addSubview(logInAccountLabel)
        view.addSubview(emailInputView)
        view.addSubview(passwardInputView)
        view.addSubview(logInButton)
    }
    
    // MARK: - addLocation
    private func addLocation(){
        logInImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(screenHeight/3.44)
            $0.height.equalToSuperview().dividedBy(27.06)
            $0.width.equalToSuperview().dividedBy(4.6)
            $0.centerX.equalToSuperview()
        }
        
        logInAccountLabel.snp.makeConstraints {
            $0.top.equalTo(logInImageView.snp.bottom).offset(screenHeight/81.2)
            $0.centerX.equalToSuperview()
        }
        
        emailInputView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(logInAccountLabel.snp.bottom).offset(screenHeight/20.3)
            $0.height.equalToSuperview().dividedBy(19.33)
            $0.width.equalToSuperview().dividedBy(1.59)
        }
        
        passwardInputView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(emailInputView.snp.bottom).offset(screenHeight/60.3)
            $0.height.equalToSuperview().dividedBy(19.33)
            $0.width.equalToSuperview().dividedBy(1.59)
        }
        
        logInButton.snp.makeConstraints {
            $0.top.equalTo(passwardInputView.snp.bottom).offset(screenHeight/20.3)
            $0.width.equalToSuperview().dividedBy(1.59)
            $0.height.equalToSuperview().dividedBy(19.33)
            $0.centerX.equalToSuperview()
        }
    }
}

