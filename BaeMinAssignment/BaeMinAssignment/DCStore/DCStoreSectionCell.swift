//
//  DCStoreSectionCell.swift
//  BaeMinAssignment
//
//  Created by 홍준범 on 11/14/25.
//

import UIKit

import SnapKit

class DCStoreSectionCell: UICollectionViewCell {
    
    private let lineSpacing: CGFloat = 12
    private let itemSpacing: CGFloat = 8
    private let collectViewInset: UIEdgeInsets = .init(top: 0, left: 16, bottom: 0, right: 16)
    
    private var DCStoreFeeds: [DCStoreModel] = []
    static let identifier: String = "DCStoreSectionCell"
    
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
            DCStoreFeeds = DCStoreModel.mockData
            collectionView.reloadData()
        }
    
    private func register() {
        collectionView.register(DCStoreCell.self, forCellWithReuseIdentifier: DCStoreCell.identifier)
    }
    
}

extension DCStoreSectionCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return DCStoreFeeds.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DCStoreCell.identifier, for: indexPath) as? DCStoreCell else {
            return UICollectionViewCell()
        }
        //cell.delegate = self
        cell.configure(feed: DCStoreFeeds[indexPath.item])
        return cell
    }
}

extension DCStoreSectionCell: UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = 188
        let height: CGFloat = 320
        return CGSize(width: width, height: height)
    }
}
