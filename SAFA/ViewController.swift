//
//  ViewController.swift
//  SAFA
//
//  Created by 김유진 on 2022/08/21.
//

import UIKit
import Then
import SnapKit

class ViewController: UIViewController {
    
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
    }

}

