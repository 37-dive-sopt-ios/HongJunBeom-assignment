//
//  FoodPageCell.swift
//  BaeMinAssignment
//
//  Created by 홍준범 on 11/12/25.
//

import UIKit

import SnapKit

class FoodPageCell: UICollectionViewCell {
    
    private let lineSpacing: CGFloat = 14
    private let itemSpacing: CGFloat = 8
    private let cellHeight: CGFloat = 78
    private let cellWidth: CGFloat = 62
    private let collectViewInset: UIEdgeInsets = .init(top: 16, left: 16, bottom: 16, right: 16)
    private var feeds: [FoodKindModel] = [] // 여기에 목 데이터를 넣을거야
    static let identifier: String = "FoodPageCell"
    // MARK: - UI Components
    
    private lazy var collectionView: UICollectionView = {
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .horizontal
            layout.minimumLineSpacing = lineSpacing
            layout.minimumInteritemSpacing = itemSpacing
            layout.sectionInset = collectViewInset
            
            let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
            collectionView.backgroundColor = .white
            return collectionView
        }() //여기서 컬렉션 뷰 초기화
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setLayout()
        setDelegate()
        loadMockData()
        register()
    }
    
    private func setUI() {
        self.backgroundColor = .white
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
            feeds = FoodKindModel.mockData
            collectionView.reloadData()
        }
    
    private func register() {
        collectionView.register(FoodKindCell.self, forCellWithReuseIdentifier: FoodKindCell.identifier)
    }
}

extension FoodPageCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return feeds.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FoodKindCell.identifier, for: indexPath) as? FoodKindCell else {
            return UICollectionViewCell()
        }
        cell.configure(feed: feeds[indexPath.item])
        return cell
    }
}

extension FoodPageCell: UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = cellWidth
        let height: CGFloat = cellHeight
        return CGSize(width: width, height: height)
    }
}

