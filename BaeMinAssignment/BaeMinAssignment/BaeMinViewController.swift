//
//  BaeMinViewController.swift
//  BaeMinAssignment
//
//  Created by 홍준범 on 11/8/25.
//

import UIKit

import SnapKit

enum MainSectionItem: Int, CaseIterable {
    case event
    case category
    case spacerBetweenCategoryAndPageGrid
    case pageGrid
    case spacerBetweenPageGridAndSeeMore
    case seeMoreSection
    case spacerBetweenSeeMoreAndStore
    case store
    case spacerBetweenStoreAndAd
    case advertisement
    case spacerBetweenAdvertisementAndRanking
    case ranking
    case spacerBetweenRankingAndRecentOrder
    case recentOrder
    case spacerBetweenRecentOrderAndDCStore
    case DCStore
}

class BaeMinViewController: UIViewController {
    
    private let lineSpacing: CGFloat = 0
    private let itemSpacing: CGFloat = 10
    private let cellHeight: CGFloat = 200
    private let cellWidth: CGFloat = 402
    
    private var selectedCategoryIndex: Int = 0
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = lineSpacing
        layout.minimumInteritemSpacing = itemSpacing
        layout.sectionInset = .zero
        layout.sectionHeadersPinToVisibleBounds = true
        
        let collectionView = UICollectionView(frame:
                .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .baeminBackground
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUI()
        setLayout()
        setDelegate()
        register()
    }
    
    private func setUI() {
        view.backgroundColor = .baeminBackground
    }
    
    private func setLayout() {
        [collectionView].forEach {
            view.addSubview($0)
        }
        
        collectionView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    private func register() {
        collectionView.register(SearchHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SearchHeaderView.identifier)
        collectionView.register(NavigationCell.self, forCellWithReuseIdentifier: NavigationCell.identifier)
        collectionView.register(EventCell.self, forCellWithReuseIdentifier: EventCell.identifier)
        collectionView.register(CategoryCell.self, forCellWithReuseIdentifier: CategoryCell.identifier)
        collectionView.register(PageGridCell.self, forCellWithReuseIdentifier: PageGridCell.identifier)
        collectionView.register(AdvertisementCell.self, forCellWithReuseIdentifier: AdvertisementCell.identifier)
        collectionView.register(SeeMoreSectionCell.self, forCellWithReuseIdentifier: SeeMoreSectionCell.identifier)
        collectionView.register(StoreCell.self, forCellWithReuseIdentifier: StoreCell.identifier)
        collectionView.register(RankingContainerCell.self, forCellWithReuseIdentifier: RankingContainerCell.identifier)
        collectionView.register(RecentOrderContainerCell.self, forCellWithReuseIdentifier: RecentOrderContainerCell.identifier)
        collectionView.register(DCStoreContainerCell.self, forCellWithReuseIdentifier: DCStoreContainerCell.identifier)
        collectionView.register(SpacerCell.self, forCellWithReuseIdentifier: SpacerCell.identifier)
        
    }
    
    private func setDelegate() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

enum Section: Int, CaseIterable {
    case navigation
    case searchBar
    case title
    case content
    case footer
}
extension BaeMinViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return MainSectionItem.allCases.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NavigationCell.identifier, for: indexPath) as? NavigationCell else {
                return UICollectionViewCell()
            }
            return cell
        case 1:
            guard let item = MainSectionItem(rawValue: indexPath.item) else { return UICollectionViewCell() }
            switch item {
            case .event:
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EventCell.identifier, for: indexPath) as? EventCell else {
                    return UICollectionViewCell()
                }
                return cell
            case .category:
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCell.identifier, for: indexPath) as? CategoryCell else {
                    return UICollectionViewCell()
                }
                cell.delegate = self
                return cell
            case .spacerBetweenCategoryAndPageGrid:
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SpacerCell.identifier, for: indexPath) as? SpacerCell else {
                    return UICollectionViewCell()
                }
                return cell
            case .pageGrid:
                guard let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: PageGridCell.identifier, for: indexPath) as? PageGridCell else {
                    return UICollectionViewCell()
                }
                cell.delegate = self
                return cell
            case .spacerBetweenPageGridAndSeeMore:
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SpacerCell.identifier, for: indexPath) as? SpacerCell else {
                    return UICollectionViewCell()
                }
                return cell
            case .seeMoreSection:
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SeeMoreSectionCell.identifier, for: indexPath) as? SeeMoreSectionCell else {
                    return UICollectionViewCell()
                }
                return cell
            case .spacerBetweenSeeMoreAndStore:
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SpacerCell.identifier, for: indexPath) as? SpacerCell else {
                    return UICollectionViewCell()
                }
                return cell
            case .store:
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoreCell.identifier, for: indexPath) as? StoreCell else {
                    return UICollectionViewCell()
                }
                return cell
            case .spacerBetweenStoreAndAd:
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SpacerCell.identifier, for: indexPath) as? SpacerCell else {
                    return UICollectionViewCell()
                }
                return cell
            case .advertisement:
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AdvertisementCell.identifier, for: indexPath) as? AdvertisementCell else {
                    return UICollectionViewCell()
                }
                return cell
            case .spacerBetweenAdvertisementAndRanking:
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SpacerCell.identifier, for: indexPath) as? SpacerCell else {
                    return UICollectionViewCell()
                }
                return cell
            case .ranking:
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RankingContainerCell.identifier, for: indexPath) as? RankingContainerCell else { return UICollectionViewCell() }
                let gradientLayer = CAGradientLayer()
                gradientLayer.frame = cell.contentView.bounds
                gradientLayer.colors = [
                    UIColor(hex: "#7276FF").cgColor,
                    UIColor(hex: "#FFFFFF").cgColor
                ]
                gradientLayer.locations = [0.0, 0.4]
                gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
                gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)
                cell.contentView.layer.insertSublayer(gradientLayer, at: 0)
                
                return cell
            case .spacerBetweenRankingAndRecentOrder:
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SpacerCell.identifier, for: indexPath) as? SpacerCell else {
                    return UICollectionViewCell()
                }
                return cell
            case .recentOrder:
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecentOrderContainerCell.identifier, for: indexPath) as? RecentOrderContainerCell else {
                    return UICollectionViewCell()
                }
                return cell
            case .spacerBetweenRecentOrderAndDCStore:
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SpacerCell.identifier, for: indexPath) as? SpacerCell else {
                    return UICollectionViewCell()
                }
                return cell
            case .DCStore:
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DCStoreContainerCell.identifier, for: indexPath) as? DCStoreContainerCell else {
                    return UICollectionViewCell()
                }
                return cell
                
            }
        default:
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        guard kind == UICollectionView.elementKindSectionHeader else { return UICollectionReusableView() }
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SearchHeaderView.identifier, for: indexPath) as! SearchHeaderView
        return headerView
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 1 {
            return CGSize(width: 300, height: 30)
        } else {
            return CGSize.zero
        }
    }
}

extension BaeMinViewController: UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch indexPath.section {
        case 0:
            return CGSize(width: collectionView.frame.width, height: 46)
        case 1:
            guard let item = MainSectionItem(rawValue: indexPath.item) else { return .zero }
            switch item {
            case .event:
                let width = collectionView.frame.width
                let height: CGFloat = 100
                return CGSize(width: width, height: height)
            case .category:
                let width = collectionView.frame.width
                let height: CGFloat = 48
                return CGSize(width: width, height: height)
            case .spacerBetweenCategoryAndPageGrid:
                let width = collectionView.frame.width
                let height: CGFloat = 2
                return CGSize(width: width, height: height)
            case .pageGrid:
                let width = collectionView.frame.width
                let height: CGFloat = cellHeight
                return CGSize(width: width, height: height)
            case .spacerBetweenPageGridAndSeeMore:
                let width = collectionView.frame.width
                let height: CGFloat = 1
                return CGSize(width: width, height: height)
            case .seeMoreSection:
                let width = collectionView.frame.width
                let height: CGFloat = 34
                return CGSize(width: width, height: height)
            case .spacerBetweenSeeMoreAndStore:
                let width = collectionView.frame.width
                let height: CGFloat = 10
                return CGSize(width: width, height: height)
            case .store:
                let width = collectionView.frame.width
                let height: CGFloat = 110
                return CGSize(width: width, height: height)
            case .spacerBetweenStoreAndAd:
                let width = collectionView.frame.width
                let height: CGFloat = 10
                return CGSize(width: width, height: height)
            case .advertisement:
                let width = collectionView.frame.width
                let height: CGFloat = 138
                return CGSize(width: width, height: height)
            case .spacerBetweenAdvertisementAndRanking:
                let width = collectionView.frame.width
                let height: CGFloat = 10
                return CGSize(width: width, height: height)
            case .ranking:
                let width = collectionView.frame.width
                let height: CGFloat = 320
                return CGSize(width: width, height: height)
            case .spacerBetweenRankingAndRecentOrder:
                let width = collectionView.frame.width
                let height: CGFloat = 10
                return CGSize(width: width, height: height)
            case .recentOrder:
                let width = collectionView.frame.width
                let height: CGFloat = 300
                return CGSize(width: width, height: height)
            case .spacerBetweenRecentOrderAndDCStore:
                let width = collectionView.frame.width
                let height: CGFloat = 10
                return CGSize(width: width, height: height)
            case .DCStore:
                let width = collectionView.frame.width
                let height: CGFloat = 320
                return CGSize(width: width, height: height)
            }
        default:
            return CGSize(width: collectionView.frame.width, height: 44)
        }
    }
}

extension BaeMinViewController: PageGridCellDelegate {
    func pageScrolling(currentX: CGFloat, pageWidth: CGFloat) {
        let progress = currentX / pageWidth
        
        let seeMoreindexPath = IndexPath(item: 5, section: 1)
        
        guard let  seeMoreCell = collectionView.cellForItem(at: seeMoreindexPath) as? SeeMoreSectionCell else { return }
        seeMoreCell.updateScrollProgress(progress)
    }
    
    func didPageScrolled(index: Int) {
        //        selectedCategoryIndex = index
        
        let seeMoreindexPath = IndexPath(item: 5, section: 1)
        guard let seeMoreCell = collectionView.cellForItem(at: seeMoreindexPath) as? SeeMoreSectionCell else { return }
        seeMoreCell.updateSelectedCategory(index)
        
        let categoryIndexPath = IndexPath(item: 1, section: 1)
        guard let categoryCell = collectionView.cellForItem(at: categoryIndexPath) as? CategoryCell else { return }
        categoryCell.updateSelectedCategory(index)
    }
}

extension BaeMinViewController: CategoryCellDelegate {
    func didTapCategory(section index: Int) {
        //        selectedCategoryIndex = index
        
        let pageGridIndexPath = IndexPath(item: 3, section: 1)
        guard let cell = collectionView.cellForItem(at: pageGridIndexPath) as? PageGridCell else { return }
        cell.updateCategory(index)
        
        let seeMoreindexPath = IndexPath(item: 5, section: 1)
        guard let seeMoreCell = collectionView.cellForItem(at: seeMoreindexPath) as? SeeMoreSectionCell else { return }
        seeMoreCell.updateSelectedCategory(index)
    }
}

extension BaeMinViewController: UICollectionViewDelegate {
    
}

