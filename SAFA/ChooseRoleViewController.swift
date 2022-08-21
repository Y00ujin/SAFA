//
//  ViewController.swift
//  SAFA
//
//  Created by 김유진 on 2022/08/21.
//

import UIKit
import Then
import SnapKit

final class ChooseRoleViewController: UIViewController {
    
    // MARK: - Properties
    private let screenWidth = UIScreen.main.bounds.width
    private let screenHeight = UIScreen.main.bounds.height
    
    private lazy var startSAFAImageView = UIImageView().then {
        $0.image = UIImage(named: "SAFA_StartSAFAImage")
    }
    
    private lazy var logInAccountLabel = UILabel().then {
        $0.text = "자신에게 해당하는 역할을 선택해주세요."
        $0.font = UIFont(name: "AppleSDGothicNeo-Light", size: 13)
        $0.textColor = UIColor(red: 80/255, green: 80/255, blue: 80/255, alpha: 1)
    }
    
    private lazy var armyRoleButton = UIButton().then {
        $0.layer.borderWidth = 0.7
        $0.layer.borderColor = UIColor(red: 224/255, green: 224/255, blue: 224/255, alpha: 1).cgColor
        $0.layer.cornerRadius = 10
        $0.setTitle("장병", for: .normal)
        $0.setTitleColor(UIColor(red: 150/255, green: 150/255, blue: 150/255, alpha: 1), for: .normal)
        $0.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 12)
        $0.addTarget(self, action: #selector(armyRoleButtonClicked(sender:)), for: .touchUpInside)
    }
    
    private lazy var officerRoleButton = UIButton().then {
        $0.layer.borderWidth = 0.7
        $0.layer.borderColor = UIColor(red: 224/255, green: 224/255, blue: 224/255, alpha: 1).cgColor
        $0.layer.cornerRadius = 10
        $0.setTitle("간부", for: .normal)
        $0.setTitleColor(UIColor(red: 150/255, green: 150/255, blue: 150/255, alpha: 1), for: .normal)
        $0.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 12)
        $0.addTarget(self, action: #selector(officerRoleButtonClicked(sender:)), for: .touchUpInside)
    }
    
    private lazy var familyRoleButton = UIButton().then {
        $0.layer.borderWidth = 0.7
        $0.layer.borderColor = UIColor(red: 224/255, green: 224/255, blue: 224/255, alpha: 1).cgColor
        $0.layer.cornerRadius = 10
        $0.setTitle("가족", for: .normal)
        $0.setTitleColor(UIColor(red: 150/255, green: 150/255, blue: 150/255, alpha: 1), for: .normal)
        $0.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 12)
        $0.addTarget(self, action: #selector(familyRoleButtonClicked(sender:)), for: .touchUpInside)
    }
    
    private lazy var startAppButton = UIButton().then {
        $0.setTitle("앱 시 작  하기", for: .normal)
        $0.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 12)
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
        view.addSubview(startSAFAImageView)
        view.addSubview(logInAccountLabel)
        view.addSubview(startAppButton)
        view.addSubview(armyRoleButton)
        view.addSubview(officerRoleButton)
        view.addSubview(familyRoleButton)
    }
    
    // MARK: - addLocation
    private func addLocation(){
        startSAFAImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(screenHeight/3.44)
            $0.height.equalToSuperview().dividedBy(35.06)
            $0.width.equalToSuperview().dividedBy(2.3)
            $0.centerX.equalToSuperview()
        }
        
        logInAccountLabel.snp.makeConstraints {
            $0.top.equalTo(startSAFAImageView.snp.bottom).offset(screenHeight/81.2)
            $0.centerX.equalToSuperview()
        }
        
        armyRoleButton.snp.makeConstraints {
            $0.left.equalToSuperview().offset(screenWidth/8.33)
            $0.width.equalToSuperview().dividedBy(4.36)
            $0.height.equalToSuperview().dividedBy(5.6)
            $0.top.equalTo(logInAccountLabel.snp.bottom).offset(screenHeight/15.32)
        }
        
        officerRoleButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.width.equalToSuperview().dividedBy(4.36)
            $0.height.equalToSuperview().dividedBy(5.6)
            $0.top.equalTo(logInAccountLabel.snp.bottom).offset(screenHeight/15.32)
        }
        
        familyRoleButton.snp.makeConstraints {
            $0.right.equalToSuperview().offset(-screenWidth/8.33)
            $0.width.equalToSuperview().dividedBy(4.36)
            $0.height.equalToSuperview().dividedBy(5.6)
            $0.top.equalTo(logInAccountLabel.snp.bottom).offset(screenHeight/15.32)
        }
        
        startAppButton.snp.makeConstraints {
            $0.top.equalTo(armyRoleButton.snp.bottom).offset(screenHeight/20.3)
            $0.width.equalToSuperview().dividedBy(1.59)
            $0.height.equalToSuperview().dividedBy(19.33)
            $0.centerX.equalToSuperview()
        }
    }
    
    // MARK: - Selector
    @objc private func armyRoleButtonClicked(sender: UIButton){
        sender.layer.borderColor = UIColor(red: 144/255, green: 153/255, blue: 133/255, alpha: 1).cgColor
        sender.setTitleColor(UIColor(red: 98/255, green: 107/255, blue: 87/255, alpha: 1), for: .normal)
        
        deselectUIChange(to: [familyRoleButton, officerRoleButton])
    }
    
    @objc private func officerRoleButtonClicked(sender: UIButton){
        sender.layer.borderColor = UIColor(red: 144/255, green: 153/255, blue: 133/255, alpha: 1).cgColor
        sender.setTitleColor(UIColor(red: 98/255, green: 107/255, blue: 87/255, alpha: 1), for: .normal)
        
        deselectUIChange(to: [armyRoleButton, familyRoleButton])
    }
    
    @objc private func familyRoleButtonClicked(sender: UIButton){
        sender.layer.borderColor = UIColor(red: 144/255, green: 153/255, blue: 133/255, alpha: 1).cgColor
        sender.setTitleColor(UIColor(red: 98/255, green: 107/255, blue: 87/255, alpha: 1), for: .normal)
        
        deselectUIChange(to: [armyRoleButton, officerRoleButton])
    }
    
    private func deselectUIChange(to views: [UIButton]) {
        for view in views {
            view.layer.borderColor = UIColor(red: 224/255, green: 224/255, blue: 224/255, alpha: 1).cgColor
            view.setTitleColor(UIColor(red: 150/255, green: 150/255, blue: 150/255, alpha: 1), for: .normal)
        }
    }

}

