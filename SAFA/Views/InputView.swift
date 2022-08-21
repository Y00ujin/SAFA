//
//  InputView.swift
//  SAFA
//
//  Created by 김유진 on 2022/08/21.
//

import UIKit
import Then
import SnapKit

final class InputView: UIView {
    // MARK: - Properties
    private lazy var inputBackgroundView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.borderWidth = 0.7
        $0.layer.borderColor = UIColor(red: 224/255, green: 224/255, blue: 224/255, alpha: 1).cgColor
        $0.layer.cornerRadius = 10
    }
    
    lazy var inputTextField = UITextField().then {
        $0.textColor = UIColor(red: 98/255, green: 98/255, blue: 98/255, alpha: 1)
        $0.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 11)
    }
    
    // MARK: - Initializer
    override init(frame: CGRect){
        super.init(frame: frame)
        
        addSubView()
        addLocation()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - addView
    private func addSubView() {
        self.addSubview(inputBackgroundView)
        inputBackgroundView.addSubview(inputTextField)
    }
    
    // MARK: - addLocation
    private func addLocation() {
        inputBackgroundView.snp.makeConstraints {
            $0.top.bottom.left.right.equalToSuperview()
        }
                
        inputTextField.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.equalToSuperview().dividedBy(1.2)
            $0.height.equalToSuperview()
        }
    }
}
