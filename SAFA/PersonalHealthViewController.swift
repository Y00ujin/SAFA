//
//  PersonalHealthViewController.swift
//  SAFA
//
//  Created by 김유진 on 2022/08/23.
//

import UIKit

class PersonalHealthViewController: UIViewController {
    // MARK: - Properties
    private let screenWidth = UIScreen.main.bounds.width
    private let screenHeight = UIScreen.main.bounds.height
    
    private let medicineArray = ["코디오반정80/12.5mg, 스티핀정 10mg", "매피정(메틸프레드니솔론)_(4mg/1정)"]
    private let medicineSubTitleArray = ["(함량:1정, 1회 투약량:1알, 1일 투여횟수: 1, 총 투약횟수 91일)", "(함량:1정, 1회 투약량:1알, 1일 투여횟수: 1, 총 투약횟수 4일)"]
    private let medicalHistoryArray = ["팔 뒤꿈치 열상", "왼쪽 전방십자인대 파열", "고열 및 두통", "회전근개 파열"]
    private let medicalHistorySubTitleArray = ["2022.06.22", "2022.07.01", "2022.07.08", "2022.08.21"]
    private let vaccinationArray = ["B형 감염", "폴리오"]
    private let vaccinationSubTitleArray = ["(2차 완료)", "(4차 완료)"]
    
    private lazy var personalHealthImageView = UIImageView().then {
        $0.image = UIImage(named: "SAFA_PersonalHealthImage")
    }
    
    private lazy var medicineLabel = UILabel().then {
        $0.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 14)
        $0.text = "내가 먹는 약"
        $0.textColor = UIColor(red: 103/255, green: 103/255, blue: 103/255, alpha: 1)
    }
    
    private lazy var medicalHistoryLabel = UILabel().then {
        $0.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 14)
        $0.text = "진료 이력"
        $0.textColor = UIColor(red: 103/255, green: 103/255, blue: 103/255, alpha: 1)
    }
    
    private lazy var vaccinationLabel = UILabel().then {
        $0.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 14)
        $0.text = "예방 접종"
        $0.textColor = UIColor(red: 103/255, green: 103/255, blue: 103/255, alpha: 1)
    }
    
    private lazy var medicineTableView = UITableView().then {
        $0.separatorStyle = .none
        $0.register(PersonalHealthTableViewCell.self, forCellReuseIdentifier: PersonalHealthTableViewCell.identifier)
    }
    
    private lazy var medicalHistoryTableView = UITableView().then {
        $0.separatorStyle = .none
        $0.register(PersonalHealthTableViewCell.self, forCellReuseIdentifier: PersonalHealthTableViewCell.identifier)
    }
    
    private lazy var vaccinationTableView = UITableView().then {
        $0.separatorStyle = .none
        $0.register(PersonalHealthTableViewCell.self, forCellReuseIdentifier: PersonalHealthTableViewCell.identifier)
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
        medicineTableView.delegate = self
        medicineTableView.dataSource = self
        medicalHistoryTableView.delegate = self
        medicalHistoryTableView.dataSource = self
        vaccinationTableView.delegate = self
        vaccinationTableView.dataSource = self
    }

    // MARK: - addSubView
    private func addSubView() {
        view.addSubview(personalHealthImageView)
        view.addSubview(medicineLabel)
        view.addSubview(medicineTableView)
        view.addSubview(medicalHistoryLabel)
        view.addSubview(medicalHistoryTableView)
        view.addSubview(vaccinationLabel)
        view.addSubview(vaccinationTableView)
    }
    
    // MARK: - addLocation
    private func addLocation() {
        personalHealthImageView.snp.makeConstraints {
            $0.left.equalToSuperview().offset(screenWidth/10.02)
            $0.height.equalToSuperview().dividedBy(34.06)
            $0.width.equalToSuperview().dividedBy(1.9)
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
        }
        
        medicineLabel.snp.makeConstraints {
            $0.left.equalTo(personalHealthImageView)
            $0.top.equalTo(personalHealthImageView.snp.bottom).offset(screenHeight/40)
        }
        
        medicineTableView.snp.makeConstraints {
            $0.width.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.height.equalToSuperview().dividedBy(4)
            $0.top.equalTo(medicineLabel.snp.bottom).offset(screenHeight/110)
        }
        
        medicalHistoryLabel.snp.makeConstraints {
            $0.left.equalTo(personalHealthImageView)
            $0.top.equalTo(medicineTableView.snp.bottom).offset(screenHeight/70)
        }
        
        medicalHistoryTableView.snp.makeConstraints {
            $0.width.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.height.equalToSuperview().dividedBy(4)
            $0.top.equalTo(medicalHistoryLabel.snp.bottom).offset(screenHeight/70)
        }
        
        vaccinationLabel.snp.makeConstraints {
            $0.left.equalTo(personalHealthImageView)
            $0.top.equalTo(medicalHistoryTableView.snp.bottom).offset(screenHeight/70)
        }
        
        vaccinationTableView.snp.makeConstraints {
            $0.width.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.top.equalTo(vaccinationLabel.snp.bottom).offset(screenHeight/70)
        }
    }
}

extension PersonalHealthViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == medicineTableView {
            return medicineArray.count
        } else if tableView == medicalHistoryTableView {
            return medicalHistoryArray.count
        } else {
            return vaccinationArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PersonalHealthTableViewCell.identifier, for: indexPath) as! PersonalHealthTableViewCell
        
        cell.selectionStyle = .none
        
        if tableView == medicineTableView {
            cell.titleLabel.text = medicineArray[indexPath.row]
            cell.subTitleLabel.text = medicineArray[indexPath.row]
        } else if tableView == medicalHistoryTableView {
            cell.titleLabel.text = medicalHistoryArray[indexPath.row]
            cell.subTitleLabel.text = medicalHistorySubTitleArray[indexPath.row]
        } else {
            cell.titleLabel.text = vaccinationArray[indexPath.row]
            cell.subTitleLabel.text = vaccinationSubTitleArray[indexPath.row]
        }

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}
