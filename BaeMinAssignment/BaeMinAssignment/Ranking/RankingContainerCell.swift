//
//  RankingContainerCell.swift
//  BaeMinAssignment
//
//  Created by 홍준범 on 11/13/25.
//

import UIKit

import SnapKit

final class RankingContainerCell: UICollectionViewCell, UICollectionViewDelegate {

    static let identifier: String = "RankingContainerCell"
    
    private let lineSpacing: CGFloat = 0
    private let itemSpacing: CGFloat = 10
    private let cellHeight: CGFloat = 200
    private let cellWidth: CGFloat = 402
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = lineSpacing
        layout.minimumInteritemSpacing = itemSpacing
        layout.sectionInset = .zero
        layout.sectionHeadersPinToVisibleBounds = true
        
        let collectionView = UICollectionView(frame:
                .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear //영향 x
        collectionView.isScrollEnabled = false
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
        setDelegate()
        register()
    }
    
    private func setUI() {
        self.backgroundColor = .clear //영향 x
    }
    
    private func setDelegate() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    private func setLayout() {
        contentView.addSubviews(collectionView)
        
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func register() {
        collectionView.register(RankingPageCell.self, forCellWithReuseIdentifier: RankingPageCell.identifier)
        collectionView.register(RankingHeaderCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: RankingHeaderCell.identifier)
    }
}

extension RankingContainerCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RankingPageCell.identifier, for: indexPath) as? RankingPageCell else {
            return UICollectionViewCell()
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard kind == UICollectionView.elementKindSectionHeader else { return UICollectionReusableView() }
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: RankingHeaderCell.identifier, for: indexPath) as! RankingHeaderCell
        return headerView
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let width: CGFloat = collectionView.frame.width
        let height: CGFloat = 60
        return CGSize(width: width, height: height)
    }
}


extension RankingContainerCell: UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width
        let height = collectionView.frame.height
        return CGSize(width: width, height: height)
    }
}
