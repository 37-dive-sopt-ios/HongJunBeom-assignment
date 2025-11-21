//
//  AdvertisementCell.swift
//  BaeMinAssignment
//
//  Created by 홍준범 on 11/8/25.
//

import UIKit
import SnapKit

final class AdvertisementCell: UICollectionViewCell {
    private let lineSpacing: CGFloat = 0
    private let collectViewInset: UIEdgeInsets = .init(top: 0, left: 0, bottom: 0, right: 0)
    private var feeds: [AdModel] = [] // 여기에 목 데이터를 넣을거야
    static let identifier: String = "AdvertisementCell"
    
    // MARK: - UI Components
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = lineSpacing
        layout.sectionInset = collectViewInset
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = true
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setLayout()
        setDelegate()
        loadMockData()
        register()
    }
    
    private func setUI() {
        self.backgroundColor = .gray
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
        feeds = AdModel.mockData
        collectionView.reloadData()
    }
    
    private func register() {
        collectionView.register(AdvertisementSecondCell.self, forCellWithReuseIdentifier: AdvertisementSecondCell.identifier)
    }
}

extension AdvertisementCell: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AdvertisementSecondCell.identifier, for: indexPath) as? AdvertisementSecondCell else {
            return UICollectionViewCell()
        }
        
        //cell.delegate = self
        cell.configure(feed: feeds[indexPath.item])
        return cell
    }
}

extension AdvertisementCell: UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width
        let height = collectionView.frame.height
        return CGSize(width: width, height: height)
    }
}
