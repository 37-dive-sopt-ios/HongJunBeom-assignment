//
//  RecentOrderSectionCell.swift
//  BaeMinAssignment
//
//  Created by 홍준범 on 11/14/25.
//

import UIKit

import SnapKit

class RecentOrderSectionCell: UICollectionViewCell {
    
    private let lineSpacing: CGFloat = 12
    private let itemSpacing: CGFloat = 8
    private let collectViewInset: UIEdgeInsets = .init(top: 0, left: 16, bottom: 0, right: 16)
    
    private var recentOrderFeeds: [RecentOrderModel] = []
    static let identifier: String = "RecentOrderSectionCell"
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = collectViewInset
        layout.minimumLineSpacing = lineSpacing
        layout.minimumInteritemSpacing = itemSpacing
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
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
            recentOrderFeeds = RecentOrderModel.mockData
            collectionView.reloadData()
        }
    
    private func register() {
        collectionView.register(RecentOrderCell.self, forCellWithReuseIdentifier: RecentOrderCell.identifier)
    }
    
}

extension RecentOrderSectionCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recentOrderFeeds.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecentOrderCell.identifier, for: indexPath) as? RecentOrderCell else {
            return UICollectionViewCell()
        }
        //cell.delegate = self
        cell.configure(feed: recentOrderFeeds[indexPath.item])
        return cell
    }
}

extension RecentOrderSectionCell: UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = 188
        let height: CGFloat = 300
        return CGSize(width: width, height: height)
    }
}
