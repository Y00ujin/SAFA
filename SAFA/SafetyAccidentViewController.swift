//
//  SafetyAccidentViewController.swift
//  SAFA
//
//  Created by 김유진 on 2022/08/23.
//

import UIKit

final class SafetyAccidentViewController: UIViewController {
    private lazy var riskTextLabel = UILabel().then {
        $0.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 16)
        $0.text = "안전 사고 정보 카테고리"
        $0.textColor = UIColor(red: 103/255, green: 103/255, blue: 103/255, alpha: 1)
    }
    
    private lazy var todayTrainingTableView = UITableView().then {
        $0.separatorStyle = .none
        $0.register(TodayTraningTableViewCell.self, forCellReuseIdentifier: TodayTraningTableViewCell.identifier)
    }
    
    private let safetyAccidentArray = ["차량","화재","총기","감전","시설물","온열","낙상"]
    
    // MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        addSubView()
        addLocation()
        addDelegate()
    }

    private func addDelegate() {
        todayTrainingTableView.delegate = self
        todayTrainingTableView.dataSource = self
    }

    // MARK: - addSubView
    private func addSubView() {
        view.addSubview(riskTextLabel)
        view.addSubview(todayTrainingTableView)
    }

    // MARK: - addLocation
    private func addLocation() {
        riskTextLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.centerX.equalToSuperview()
        }
        
        todayTrainingTableView.snp.makeConstraints {
            $0.width.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.top.equalTo(riskTextLabel.snp.bottom).offset(50)
        }
    }
}


extension SafetyAccidentViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return safetyAccidentArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TodayTraningTableViewCell.identifier, for: indexPath) as! TodayTraningTableViewCell
        
        cell.selectionStyle = .none
        cell.traningNameLabel.text = safetyAccidentArray[indexPath.row]
        
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 1 {
            
        }
    }
}
