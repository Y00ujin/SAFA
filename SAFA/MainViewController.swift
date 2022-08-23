//
//  MainViewController.swift
//  SAFA
//
//  Created by 김유진 on 2022/08/21.
//

import UIKit

final class MainViewController: UIViewController {
    // MARK: - Properties
    private let screenWidth = UIScreen.main.bounds.width
    private let screenHeight = UIScreen.main.bounds.height
    
    private let traningArray = ["", "중대급 식중독 예방 점검, 교육", "일일 전투체육"]
    
    private lazy var introImageView = UIImageView().then {
        $0.image = UIImage(named: "SAFA_IntroImage")
    }
    
    private lazy var myPageButton = UIButton().then {
        $0.setImage(UIImage(named: "SAFA_MyPageImage"), for: .normal)
    }
    
    private lazy var riskNumberLabel = UILabel().then {
        $0.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 80)
        $0.textColor = UIColor(red: 102/255, green: 111/255, blue: 89/255, alpha: 1)
        $0.text = "75"
    }
    
    private lazy var riskTextLabel = UILabel().then {
        $0.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 14)
        $0.text = "오늘의 위험도 지수를 확인해보세요."
        $0.textColor = UIColor(red: 103/255, green: 103/255, blue: 103/255, alpha: 1)
    }
    
    private lazy var lineView = UIView().then {
        $0.backgroundColor = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1)
    }
    
    private lazy var todayTrainingTableView = UITableView().then {
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
        todayTrainingTableView.delegate = self
        todayTrainingTableView.dataSource = self
    }

    // MARK: - addSubView
    private func addSubView() {
        view.addSubview(introImageView)
        view.addSubview(myPageButton)
        view.addSubview(riskNumberLabel)
        view.addSubview(riskTextLabel)
        view.addSubview(lineView)
        view.addSubview(todayTrainingTableView)
    }
    
    // MARK: - addLocation
    private func addLocation() {
        introImageView.snp.makeConstraints {
            $0.left.equalToSuperview().offset(screenWidth/10.02)
            $0.height.equalToSuperview().dividedBy(34.06)
            $0.width.equalToSuperview().dividedBy(2.18)
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
        }
        
        myPageButton.snp.makeConstraints {
            $0.width.height.equalTo(20)
            $0.right.equalToSuperview().offset(-screenWidth/10.02)
            $0.centerY.equalTo(introImageView)
        }
        
        riskNumberLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(introImageView.snp.bottom).offset(screenHeight/8.12)
        }
        
        riskTextLabel.snp.makeConstraints {
            $0.top.equalTo(riskNumberLabel.snp.bottom).offset(screenHeight/80.6)
            $0.centerX.equalToSuperview()
        }
        
        lineView.snp.makeConstraints {
            $0.height.equalTo(0.8)
            $0.centerX.equalToSuperview()
            $0.left.equalToSuperview().offset(screenWidth/10.02)
            $0.top.equalTo(riskTextLabel.snp.bottom).offset(screenHeight/10.6)
        }
        
        todayTrainingTableView.snp.makeConstraints {
            $0.width.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.top.equalTo(lineView.snp.bottom)
        }
    }
}


extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TodayTraningTableViewCell.identifier, for: indexPath) as! TodayTraningTableViewCell
        
        cell.selectionStyle = .none
        
        if indexPath.row == 0 {
            cell.traningNameLabel.text = "부대 예정 활동 보러가기 >"
        } else {
            cell.traningNameLabel.text = traningArray[indexPath.row]
        }
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let nvc = TraningPlanViewController()
            self.navigationController?.pushViewController(nvc, animated: true)
        }
    }
}
