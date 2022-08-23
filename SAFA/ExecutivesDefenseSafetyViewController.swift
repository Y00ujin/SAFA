//
//  ExecutivesDefenseSafetyViewController.swift
//  SAFA
//
//  Created by 김유진 on 2022/08/23.
//

import UIKit

final class ExecutivesDefenseSafetyViewController: UIViewController {
    // MARK: - Properties
    private let screenWidth = UIScreen.main.bounds.width
    private let screenHeight = UIScreen.main.bounds.height
    
    private let defenseSafetyArray = ["안전 사고", "안전 교육", "사전 체크리스트", "안전 점검", "안전 사고 보고"]
    
    private lazy var defenseSafetyImageView = UIImageView().then {
        $0.image = UIImage(named: "SAFA_DefenseSafety")
    }
    
    private lazy var checkDefenseSafetyLabel = UILabel().then {
        $0.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 14)
        $0.text = "국방 안전 정보를 확인해보세요."
        $0.textColor = UIColor(red: 103/255, green: 103/255, blue: 103/255, alpha: 1)
    }
    
    private lazy var defenseSafetyTableView = UITableView().then {
        $0.separatorStyle = .none
        $0.register(TodayTraningTableViewCell.self, forCellReuseIdentifier: TodayTraningTableViewCell.identifier)
    }
    
    
    // MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        addSubView()
        addLocation()
        addDelegate()
    }
    
    private func addDelegate() {
        defenseSafetyTableView.delegate = self
        defenseSafetyTableView.dataSource = self
    }
    
    // MARK: - addSubView
    private func addSubView() {
        view.addSubview(defenseSafetyImageView)
        view.addSubview(checkDefenseSafetyLabel)
        view.addSubview(defenseSafetyTableView)
    }
    
    // MARK: - addLocation
    private func addLocation() {
        defenseSafetyImageView.snp.makeConstraints {
            $0.left.equalToSuperview().offset(screenWidth/10.02)
            $0.height.equalToSuperview().dividedBy(34.06)
            $0.width.equalToSuperview().dividedBy(1.9)
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
        }
        
        checkDefenseSafetyLabel.snp.makeConstraints {
            $0.left.equalTo(defenseSafetyImageView)
            $0.top.equalTo(defenseSafetyImageView.snp.bottom).offset(screenHeight/70)
        }
        
        defenseSafetyTableView.snp.makeConstraints {
            $0.top.equalTo(checkDefenseSafetyLabel.snp.bottom).offset(screenHeight/40)
            $0.bottom.equalToSuperview()
            $0.width.equalToSuperview()
        }
    }
}

extension ExecutivesDefenseSafetyViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TodayTraningTableViewCell.identifier, for: indexPath) as! TodayTraningTableViewCell
        
        cell.selectionStyle = .none
        
        cell.traningNameLabel.text = defenseSafetyArray[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}

