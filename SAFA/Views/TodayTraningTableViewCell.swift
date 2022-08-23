//
//  todayTraningTableViewCell.swift
//  SAFA
//
//  Created by 김유진 on 2022/08/21.
//

import UIKit

class TodayTraningTableViewCell: UITableViewCell {
    
    static let identifier = "\(TodayTraningTableViewCell.self)"

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
    
    
    lazy var traningNameLabel = UILabel().then{
        $0.textColor = UIColor(red: 118/255, green: 96/255, blue: 87/255, alpha: 1)
        $0.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 13)
    }
    
    // MARK: - LifeCycles
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: size.width/20.416, left: size.width/10.416, bottom: 0, right: size.width/10.416))
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
        cellBackgroundView.addSubview(traningNameLabel)
    }
    
    private func addLocation(){
        cellBackgroundView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        
        
        traningNameLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.left.equalToSuperview().offset(screenWidth/20)
        }
        
    }
}
