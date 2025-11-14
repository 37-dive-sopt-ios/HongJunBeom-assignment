//
//  RankingPageCell.swift
//  BaeMinAssignment
//
//  Created by 홍준범 on 11/12/25.
//

import UIKit

import SnapKit

final class RankingPageCell: UICollectionViewCell {
    
    private let lineSpacing: CGFloat = 12
    private let itemSpacing: CGFloat = 8
    private let collectViewInset: UIEdgeInsets = .init(top: 0, left: 16, bottom: 0, right: 16)
    private var rankingFeeds: [RankingModel] = [] // 여기에 목 데이터를 넣을거야
    static let identifier: String = "RankingPageCell"
    // MARK: - UI Components
    
    private lazy var collectionView: UICollectionView = {
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .horizontal
            layout.minimumLineSpacing = lineSpacing
            layout.minimumInteritemSpacing = itemSpacing
            layout.sectionInset = collectViewInset
            
            let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
            collectionView.backgroundColor = .clear
            return collectionView
        }() //여기서 컬렉션 뷰 초기화
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setLayout()
        register()
        setDelegate()
        loadMockData()
        
    }
    
    private func setUI() {
        self.backgroundColor = .clear
    }
    
    private func setDelegate() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    private func setLayout() {
        self.addSubviews(collectionView)
        
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Data
        
        private func loadMockData() {
            rankingFeeds = RankingModel.mockData
            collectionView.reloadData()
        }
    
    private func register() {
        collectionView.register(RankingCell.self, forCellWithReuseIdentifier: RankingCell.identifier)
    }
}

extension RankingPageCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return rankingFeeds.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RankingCell.identifier, for: indexPath) as? RankingCell else {
            return UICollectionViewCell()
        }
        //cell.delegate = self
        cell.configure(feed: rankingFeeds[indexPath.item])
        return cell
    }
}

extension RankingPageCell: UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = 160
        let height: CGFloat = 320
        return CGSize(width: width, height: height)
    }
}
