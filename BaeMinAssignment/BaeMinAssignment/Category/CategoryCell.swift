//
//  CategoryCell.swift
//  BaeMinAssignment
//
//  Created by 홍준범 on 11/8/25.
//

import UIKit

import SnapKit

enum Category: Int, CaseIterable {
    case delivery
    case pickUp
    case shopping
    case gift
    case benefit
}

protocol CategoryCellDelegate: AnyObject {
    func didTapCategory(section: Int)
}

class CategoryCell: UICollectionViewCell {
    
    weak var delegate: CategoryCellDelegate?
    private let lineSpacing: CGFloat = 16
    private let itemSpacing: CGFloat = 8
    private let cellWidth: CGFloat = 62
    private let collectViewInset: UIEdgeInsets = .init(top: 0, left: 16, bottom: 0, right: 16)
    private var feeds: [CategoryModel] = []
    static let identifier: String = "CategoryCell"
    // MARK: - UI Components
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = lineSpacing
        layout.minimumInteritemSpacing = itemSpacing
        layout.sectionInset = collectViewInset
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.clipsToBounds = true
        collectionView.layer.cornerRadius = 20
        collectionView.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMinXMinYCorner, .layerMaxXMinYCorner)
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
    
    // MARK: - Data
    
    private func loadMockData() {
        feeds = CategoryModel.mockData
        collectionView.reloadData()
    }
    
    private func register() {
        collectionView.register(CategorySecondCell.self, forCellWithReuseIdentifier: CategorySecondCell.identifier)
    }
    
    func updateSelectedCategory(_ index: Int) {
        let indexPath = IndexPath(item: index, section: 0)
        collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
        
        if let cell = collectionView.cellForItem(at: indexPath) as? CategorySecondCell {
            cell.categoryLabel.textColor = .baeminBlack
        }
    }
}

extension CategoryCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return feeds.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategorySecondCell.identifier, for: indexPath) as? CategorySecondCell else {
            return UICollectionViewCell()
        }
        
        if indexPath.item == 0 {
            collectionView.selectItem(at: indexPath, animated: false, scrollPosition: .init())
        }
        cell.configure(feed: feeds[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? CategorySecondCell {
            cell.categoryLabel.textColor = .baeminBlack
            
            delegate?.didTapCategory(section: indexPath.item)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? CategorySecondCell {
            cell.categoryLabel.textColor = .baeminGray200
        }
    }
}

extension CategoryCell: UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = collectionView.frame.height
        guard let item = Category(rawValue: indexPath.item) else { return .zero }
        switch item {
        case .delivery:
            let width: CGFloat = 80
            return CGSize(width: width, height: height)
        case .pickUp:
            let width: CGFloat = 40
            return CGSize(width: width, height: height)
        case .shopping:
            let width: CGFloat = 100
            return CGSize(width: width, height: height)
        case .gift:
            let width: CGFloat = 60
            return CGSize(width: width, height: height)
        case .benefit:
            let width: CGFloat = 100
            return CGSize(width: width, height: height)
        }
    }
}
