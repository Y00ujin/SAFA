//
//  TraningPlanViewController.swift
//  SAFA
//
//  Created by 김유진 on 2022/08/21.
//

import UIKit

final class TraningPlanViewController: UIViewController {
    private lazy var riskTextLabel = UILabel().then {
        $0.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 16)
        $0.text = "부대 예정 활동"
        $0.textColor = UIColor(red: 103/255, green: 103/255, blue: 103/255, alpha: 1)
    }
    
    private lazy var todayTrainingTableView = UITableView().then {
        $0.separatorStyle = .none
        $0.register(TodayTraningTableViewCell.self, forCellReuseIdentifier: TodayTraningTableViewCell.identifier)
    }
    
    private let traningArray = ["일 : 전투 휴무, 일일 전투 체육", "월 : 전투준비태세훈련, 제초 작업", "화 : 경계 시범식 교육, 일일 전투체육", "수 : 중대급 식중독 예방 점검*교육, 일일 전투체육", "목 : 예방 정비, 물골 작업", "금 : 하계 휴향, 독서 활동"]
    
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


extension TraningPlanViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return traningArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TodayTraningTableViewCell.identifier, for: indexPath) as! TodayTraningTableViewCell
        
        cell.selectionStyle = .none
        cell.traningNameLabel.text = traningArray[indexPath.row]
        
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
