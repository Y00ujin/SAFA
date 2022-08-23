//
//  PersonalHealthTableViewCell.swift
//  SAFA
//
//  Created by 김유진 on 2022/08/23.
//

import UIKit

class PersonalHealthTableViewCell: UITableViewCell {
    
    static let identifier = "\(PersonalHealthTableViewCell.self)"

    // MARK: - Properties
    private let screenWidth = UIScreen.main.bounds.width
    private let screenHeight = UIScreen.main.bounds.height
    
    private let size = UIScreen.main.bounds
    
    lazy var cellBackgroundView = UIView().then{
        $0.backgroundColor = .white
        $0.layer.cornerRadius = size.height/29/2
        $0.layer.shadowColor = UIColor(red: 229/255, green: 229/255, blue: 229/255, alpha: 1).cgColor
        $0.layer.shadowOffset = CGSize(width: 0, height: 4)
        $0.layer.shadowOpacity = 0.8
        $0.layer.shadowRadius = 5.0
    }
    
    lazy var titleLabel = UILabel().then{
        $0.textColor = UIColor(red: 118/255, green: 96/255, blue: 87/255, alpha: 1)
        $0.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 13)
    }
    
    lazy var subTitleLabel = UILabel().then{
        $0.textColor = UIColor(red: 118/255, green: 96/255, blue: 87/255, alpha: 1)
        $0.font = UIFont(name: "AppleSDGothicNeo-Light", size: 11)
    }
    
    // MARK: - LifeCycles
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: size.width/60, left: size.width/10.416, bottom: 0, right: size.width/10.416))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helpers
    private func setView(){
        addView()
        addLocation()
    }
    
    private func addView(){
        contentView.addSubview(cellBackgroundView)
        cellBackgroundView.addSubview(titleLabel)
        cellBackgroundView.addSubview(subTitleLabel)
    }
    
    private func addLocation(){
        cellBackgroundView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints {
            $0.left.equalToSuperview().offset(screenWidth/20)
            $0.top.equalToSuperview().offset(screenHeight/35)
        }
        
        subTitleLabel.snp.makeConstraints {
            $0.left.equalToSuperview().offset(screenWidth/20)
            $0.bottom.equalToSuperview().offset(-screenHeight/35)
        }
        
    }
}
