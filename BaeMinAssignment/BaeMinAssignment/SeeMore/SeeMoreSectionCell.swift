//
//  SeeMoreSectionCell.swift
//  BaeMinAssignment
//
//  Created by 홍준범 on 11/13/25.
//

import UIKit

import SnapKit

final class SeeMoreSectionCell: UICollectionViewCell {
    static let identifier: String = "SeeMoreSectionCell"
    
    private var seeMoreFeeds: [SeeMoreModel] = []
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.sectionInset = .zero
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.isPagingEnabled = true
        collectionView.isScrollEnabled = false
        collectionView.showsHorizontalScrollIndicator = false
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
    
    // MARK: - Datas
    private func register() {
        collectionView.register(SeeMoreCell.self, forCellWithReuseIdentifier: SeeMoreCell.identifier)
    }
    
    private func loadMockData() {
        seeMoreFeeds = SeeMoreModel.mockData
        collectionView.reloadData()
    }
    
    var selectedCategory: Int = 0
    
    func updateSelectedCategory(_ index: Int) {
        selectedCategory = index
        scrollToPage(index, animated: true)
    }
    
    func scrollToPage(_ index: Int, animated: Bool) {
        let itemCount = collectionView.numberOfItems(inSection: 0)
        guard index >= 0, index < itemCount else { return }
        
        let indexPath = IndexPath(item: index, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: animated)
    }
    
    func updateScrollProgress(_ progress: CGFloat) {
        let pageWidth = collectionView.bounds.width
        collectionView.contentOffset.x = progress * pageWidth
    }
}

extension SeeMoreSectionCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return seeMoreFeeds.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SeeMoreCell.identifier, for: indexPath) as? SeeMoreCell else {
            return UICollectionViewCell()
        }
        
        cell.configure(feed: seeMoreFeeds[indexPath.item])
        return cell
    }
}

extension SeeMoreSectionCell: UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width
        let height: CGFloat = 34
        return CGSize(width: width, height: height)
    }
}

extension SeeMoreSectionCell: UICollectionViewDelegate {
    
}
