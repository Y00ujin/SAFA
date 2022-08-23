//
//  DangerousGoodsReportViewController.swift
//  SAFA
//
//  Created by 김유진 on 2022/08/23.
//

import UIKit

final class DangerousGoodsReportViewController: UIViewController {
    private let screenWidth = UIScreen.main.bounds.width
    private let screenHeight = UIScreen.main.bounds.height
    
    private lazy var riskTextLabel = UILabel().then {
        $0.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 16)
        $0.text = "위험물 신고"
        $0.textColor = UIColor(red: 103/255, green: 103/255, blue: 103/255, alpha: 1)
    }
    
    private lazy var todayTrainingTableView = UITableView().then {
        $0.separatorStyle = .none
        $0.register(TodayTraningTableViewCell.self, forCellReuseIdentifier: TodayTraningTableViewCell.identifier)
    }
    
    private lazy var choosenDangerousGoodsLabel = UILabel().then {
        $0.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 13)
        $0.text = "위의 항목에서 신고할 위험물을 선택해주세요."
        $0.textColor = UIColor(red: 103/255, green: 103/255, blue: 103/255, alpha: 1)
    }
    
    private lazy var addIntroduceTextField = UITextField().then {
        $0.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 12)
        $0.placeholder = "추가로 작성하고싶은 내용을 작성해주세요."
        $0.textColor = UIColor(red: 103/255, green: 103/255, blue: 103/255, alpha: 1)
        $0.textAlignment = .center
    }
    
    private lazy var signInButton = UIButton().then {
        $0.setTitle("위 험 물  신 고 하 기", for: .normal)
        $0.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 12)
        $0.titleLabel?.textColor = .white
        $0.backgroundColor = UIColor(red: 145/255, green: 153/255, blue: 133/255, alpha: 1)
        $0.layer.cornerRadius = screenHeight/19.33/2
        $0.addTarget(self, action: #selector(signInButtonClicked(sender:)), for: .touchUpInside)
    }
    
    private let safetyAccidentArray = ["차량","화재","총기","감전","시설물","온열","낙상","근무이탈","총기","폭발물","구타 및 가혹행위","보안","대상관","자살","성폭력"]
    
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
        view.addSubview(choosenDangerousGoodsLabel)
        view.addSubview(addIntroduceTextField)
        view.addSubview(signInButton)
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
            $0.height.equalToSuperview().dividedBy(3)
            $0.top.equalTo(riskTextLabel.snp.bottom).offset(50)
        }
        
        choosenDangerousGoodsLabel.snp.makeConstraints {
            $0.top.equalTo(todayTrainingTableView.snp.bottom).offset(50)
            $0.centerX.equalToSuperview()
        }
        
        addIntroduceTextField.snp.makeConstraints {
            $0.top.equalTo(choosenDangerousGoodsLabel.snp.bottom).offset(50)
            $0.centerX.equalToSuperview()
            $0.width.equalToSuperview().dividedBy(1.5)
            $0.height.equalTo(30)
        }
        
        signInButton.snp.makeConstraints {
            $0.top.equalTo(addIntroduceTextField.snp.bottom).offset(screenHeight/20.3)
            $0.width.equalToSuperview().dividedBy(1.59)
            $0.height.equalToSuperview().dividedBy(19.33)
            $0.centerX.equalToSuperview()
        }
    }
    
    @objc private func signInButtonClicked(sender: UIButton){
        self.navigationController?.popViewController(animated: true)
    }
}


extension DangerousGoodsReportViewController: UITableViewDelegate, UITableViewDataSource {
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
        choosenDangerousGoodsLabel.text = "\(safetyAccidentArray[indexPath.row])이/가 선택되었습니다."
    }
}
