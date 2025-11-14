//
//  FoodKindCollectionViewCell.swift
//  BaeMinAssignment
//
//  Created by 홍준범 on 11/8/25.
//

import UIKit

import SnapKit

protocol PageGridCellDelegate: AnyObject {
    func didPageScrolled(index: Int)
    func pageScrolling(currentX: CGFloat, pageWidth: CGFloat)
}

extension PageGridCell: UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageWidth = scrollView.frame.width
        let currentPage = Int(scrollView.contentOffset.x / pageWidth)
        delegate?.didPageScrolled(index: currentPage)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let currentX = scrollView.contentOffset.x
        let pageWidth = scrollView.frame.width
        delegate?.pageScrolling(currentX: currentX, pageWidth: pageWidth)
    }
}

class PageGridCell: UICollectionViewCell {
    private let lineSpacing: CGFloat = 8
    private let itemSpacing: CGFloat = 4
    private let collectViewInset: UIEdgeInsets = .init(top: 16, left: 16, bottom: 16, right: 16)
    static let identifier: String = "PageGridCell"
    
    private var selectedCategory: Int = 0
    
    weak var delegate: PageGridCellDelegate?
    
    // MARK: - UI Components
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.sectionInset = .zero
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .white
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
        self.backgroundColor = .white
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
        collectionView.register(FoodPageCell.self, forCellWithReuseIdentifier: FoodPageCell.identifier)
        collectionView.register(PickUpPageCell.self, forCellWithReuseIdentifier: PickUpPageCell.identifier)
        collectionView.register(ShoppingPageCell.self, forCellWithReuseIdentifier: ShoppingPageCell.identifier)
    }
    
    func updateCategory(_ index: Int) {
//        selectedCategory = index
        scrollToIndex(index, animated: true)
    }
    
    func scrollToIndex(_ index: Int, animated: Bool) {
        print("스크롤", index)
        let itemCount = collectionView.numberOfItems(inSection: 0)
        guard index >= 0, index < itemCount else { return }
        
        let indexPath = IndexPath(item: index, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: animated)
    }
}

extension PageGridCell: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch indexPath.item {
        case 0:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FoodPageCell.identifier, for: indexPath) as? FoodPageCell else {
                return UICollectionViewCell()
            }
            return cell
        case 1:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PickUpPageCell.identifier, for: indexPath) as? PickUpPageCell else {
                return UICollectionViewCell()
            }
            return cell
        case 2:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ShoppingPageCell.identifier, for: indexPath) as? ShoppingPageCell else {
                return UICollectionViewCell()
            }
            return cell
        default:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ShoppingPageCell.identifier, for: indexPath) as? ShoppingPageCell else {
                return UICollectionViewCell()
            }
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? FoodKindCell {
            print("셀이 isSelected?", indexPath, cell.isSelected)
        }
        if let cell = collectionView.cellForItem(at: indexPath) as? PickUpCell {
            print("셀이 isSelected?", indexPath, cell.isSelected)
        }
    }
    
}

extension PageGridCell: UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width
        let height = collectionView.bounds.height
        return CGSize(width: width, height: height)
    }
}
