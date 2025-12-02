//
//  WelcomeViewController_Network.swift
//  BaeMinAssignment
//
//  Created by 홍준범 on 11/20/25.
//

import UIKit

import SnapKit
import Then

enum WelcomeTableViewSection: Int, CaseIterable {
    case profile
    case kakaoSetting
}

final class WelcomeViewController_Network: BaseViewController {
    
    private var kakaoSettings: [KaKaoSettingModel] = []
    
    var userId: Int?
    
    var userName: String?
    
    // MARK: - UI Components
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "환영합니다."
        label.font = .systemFont(ofSize: 28, weight: .bold)
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    
    private let tableView = UITableView(frame: .zero, style: .plain).then {
        $0.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    // MARK: - Properties
    
    // MARK: - Init
    
    private let provider: NetworkProviding
    
    public init(provider: NetworkProviding = NetworkProvider()) {
        self.provider = provider
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setHierarchy()
        setLayout()
        register()
        setDelegate()
        loadMockData()
    }
    
    private func setStyle() {
        navigationItem.title = "설정"
    }
    
    private func register() {
        tableView.register(MyProfileCell.self, forCellReuseIdentifier: MyProfileCell.identifier)
        tableView.register(KaKaoSettingCell.self, forCellReuseIdentifier: KaKaoSettingCell.identifier)
    }
    
    private func setDelegate() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func loadMockData() {
        kakaoSettings = KaKaoSettingModel.mockData
        tableView.reloadData()
    }
    
    // MARK: - UI Setup
    
    private func setHierarchy() {
        view.addSubviews(
            tableView
        )
    }
    
    private func setLayout() {
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        loadingIndicator.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
    
    // MARK: - Actions
    
    @objc private func getUserButtonTapped() {
        Task {
            guard let id = userId else { return }
            
            await performGetUser(id: id)
        }
    }

    @objc private func updateUserButtonTapped() {
        Task {
            guard let id = userId else { return }
            print(userId ?? 0)
            let profileIndexPath = IndexPath(row: 0, section: WelcomeTableViewSection.profile.rawValue)
            
            guard let profileCell = tableView.cellForRow(at: profileIndexPath) as? MyProfileCell else { return }
            
            let name = profileCell.name ?? ""
            let email = profileCell.email ?? ""
            let age = profileCell.age
            let ageText = profileCell.ageTextField.text ?? ""
            
            let isNameEmpty = name.isEmpty
            let isEmailEmpty = email.isEmpty
            let isAgeEmpty = (age == nil)
            
            if !ageText.isEmpty && isAgeEmpty {
                showAlert(title: "업데이트 실패", message: "나이는 숫자로만")
            }
            
            if isNameEmpty && isEmailEmpty && isAgeEmpty {
                showAlert(title: "업데이트 실패", message: "수정할 내용을 최소 한개 이상 입력하세요")
            } else {
                await performUpdateUser(id: id, name: name, email: email, age: age)
            }
        }
    }
    
    @objc private func deleteUserButtonTapped() {
        showDeleteConfirmation()
        guard let id = userId else { return }
        Task {
            await performDeleteUser(id: id)
        }
    }
    
    @MainActor
    private func performGetUser(id: Int) async {
        loadingIndicator.startAnimating()
        
        do {
            let response = try await UserAPI.performGetUser(id: id, provider: provider)
            
            showAlert(title: "유저 정보", message: "id: \(response.id)\nusername: \(response.username)\nname: \(response.name)\nemail: \(response.email)\nage: \(response.age)")
        } catch let error as NetworkError {
            // 콘솔에 상세 에러 로그 출력
            print("🚨 [Register Error] \(error.detailedDescription)")
            // 사용자에게는 친절한 메시지 표시
            showAlert(title: "정보조회 실패", message: error.localizedDescription)
        } catch {
            print("🚨 [Register Unknown Error] \(error)")
            showAlert(title: "정보조회 실패", message: error.localizedDescription)
        }
        loadingIndicator.stopAnimating()
    }
    
    @MainActor
    private func performUpdateUser(id: Int, name: String?, email: String?, age: Int?) async {
        loadingIndicator.startAnimating()
        
        do {
            let response = try await UserAPI.performUpdateUser(id: id, name: name, email: email, age: age, provider: provider)
            
            showAlert(title: "유저 업데이트 조회 성공", message: "업데이트 완료되었습니다!")
        } catch let error as NetworkError {
            // 콘솔에 상세 에러 로그 출력
            print("🚨 [Register Error] \(error.detailedDescription)")
            // 사용자에게는 친절한 메시지 표시
            showAlert(title: "업데이트 실패", message: error.localizedDescription)
        } catch {
            print("🚨 [Register Unknown Error] \(error)")
            showAlert(title: "업데이트 실패", message: error.localizedDescription)
        }
        loadingIndicator.stopAnimating()
    }
    
    @MainActor
    private func performDeleteUser(id: Int) async {
        loadingIndicator.startAnimating()
        
        do {
            let response = try await UserAPI.performDeleteUser(id: id, provider: provider)
            
            showAlert(title: "유저 삭제 성공", message: "삭제 완료되었습니다!") { [weak self] in
                self?.navigationController?.popViewController(animated: true)
            }
            
        } catch let error as NetworkError {
            // 콘솔에 상세 에러 로그 출력
            print("🚨 [delete Error] \(error.detailedDescription)")
            // 사용자에게는 친절한 메시지 표시
            showAlert(title: "탈퇴 실패", message: error.localizedDescription)
        } catch {
            print("🚨 [Register Unknown Error] \(error)")
            showAlert(title: "업데이트 실패", message: error.localizedDescription)
        }
        loadingIndicator.stopAnimating()
    }
    
    // MARK: - Helpers
    // TODO: 추후 분리
    
    private func createButton(title: String, color: UIColor) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.backgroundColor = color
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .semibold)
        button.titleLabel?.numberOfLines = 2
        button.titleLabel?.textAlignment = .center
        button.layer.cornerRadius = 8
        return button
    }
    
    private func showDeleteConfirmation() {

    }
}

extension WelcomeViewController_Network: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        WelcomeTableViewSection.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let section = WelcomeTableViewSection(rawValue: section) else { return 0 }
        switch section {
        case .profile:
            return 1
        case .kakaoSetting:
            return kakaoSettings.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let section = WelcomeTableViewSection(rawValue: indexPath.section) else { return UITableViewCell() }
        switch section {
        case .profile:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MyProfileCell.identifier, for: indexPath) as? MyProfileCell else { return UITableViewCell() }
            return cell
        case .kakaoSetting:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: KaKaoSettingCell.identifier, for: indexPath) as? KaKaoSettingCell else { return UITableViewCell() }
            cell.configure(kakaoSetting: kakaoSettings[indexPath.row])
            return cell
        }
    }
}

extension WelcomeViewController_Network: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let section = WelcomeTableViewSection(rawValue: indexPath.section) else { return }
        
        switch section {
        case .profile:
            break
        case .kakaoSetting:
            switch indexPath.row {
            case 0:
                updateUserButtonTapped()
            case 1:
                getUserButtonTapped()
            case 2:
                deleteUserButtonTapped()
            default:
                break
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let section = WelcomeTableViewSection(rawValue: indexPath.section) else { return 0 }
        switch section {
        case .profile:
            return 200
        case .kakaoSetting:
            return 50
        }
    }
}
