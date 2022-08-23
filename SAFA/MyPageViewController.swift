//
//  MyPageViewController.swift
//  SAFA
//
//  Created by 김유진 on 2022/08/23.
//

import UIKit

final class MyPageViewController: UIViewController {
    // MARK: - Properties
    private let screenWidth = UIScreen.main.bounds.width
    private let screenHeight = UIScreen.main.bounds.height
    
    private let checkArray = ["개인 건강 일지", "부대 사고 현황"]
    
    private lazy var myPageImageView = UIImageView().then {
        $0.image = UIImage(named: "SAFA_MyPageTextImage")
    }
    
    private lazy var checkTableView = UITableView().then {
        $0.separatorStyle = .none
        $0.register(TodayTraningTableViewCell.self, forCellReuseIdentifier: TodayTraningTableViewCell.identifier)
    }
    
    private lazy var checkLabel = UILabel().then {
        $0.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 14)
        $0.text = "개인 건강 일지, 부대 사고 현황을 확인해보세요."
        $0.textColor = UIColor(red: 103/255, green: 103/255, blue: 103/255, alpha: 1)
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
        checkTableView.delegate = self
        checkTableView.dataSource = self
    }

    // MARK: - addSubView
    private func addSubView() {
        view.addSubview(myPageImageView)
        view.addSubview(checkTableView)
    }
    
    // MARK: - addLocation
    private func addLocation() {
        myPageImageView.snp.makeConstraints {
            $0.left.equalToSuperview().offset(screenWidth/10.02)
            $0.height.equalToSuperview().dividedBy(34.06)
            $0.width.equalToSuperview().dividedBy(3.6)
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
        }
        
        checkTableView.snp.makeConstraints {
            $0.width.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.top.equalTo(myPageImageView.snp.bottom).offset(screenHeight/70)
        }
    }
}


extension MyPageViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return checkArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TodayTraningTableViewCell.identifier, for: indexPath) as! TodayTraningTableViewCell
        
        cell.selectionStyle = .none
        
        cell.traningNameLabel.text = checkArray[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let nvc = PersonalHealthViewController()
            self.navigationController?.pushViewController(nvc, animated: true)
        } else {
            
        }
    }
}
